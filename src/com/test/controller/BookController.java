package com.test.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.test.entity.Address;
import com.test.entity.Book;
import com.test.entity.ShopCar;
import com.test.entity.User;
import com.test.serviceImpl.AddressServiceImpl;
import com.test.serviceImpl.BookServiceImpl;
import com.test.utils.FileNameUtil;

@Controller
@RequestMapping("/book")
@SessionAttributes(value={"user","sold"})
public class BookController {
	
	@Autowired
	BookServiceImpl bookService;
	@Autowired
	AddressServiceImpl addressService;
	
	@RequestMapping("/getBookOnSale")
	public String getBookOnSale(Model model,@RequestParam(defaultValue="1")Integer pageNum) {
		PageInfo<Book> pageInfo = bookService.getBookOnSale(pageNum);
		model.addAttribute("pageInfo",pageInfo);
		return "/user/Hall";
	}
	
	@RequestMapping("/getBookOnSaleByType")
	public String getBookOnSale(Model model,@RequestParam(defaultValue="1")Integer pageNum,Integer type) {
		PageInfo<Book> pageInfo = bookService.getBookOnSaleByType(type, pageNum);
		model.addAttribute("type", type);
		model.addAttribute("pageInfo",pageInfo);
		return "/user/Hall";
	}
	
	@RequestMapping("/getBookByBId")
	public String getBookByPId(Model model,Integer bid) {
		Book book = bookService.getBookByBid(bid);
		model.addAttribute("book",book);
		return "/user/detail";
	}
	
	@RequestMapping("/getAllBook")
	public String getAllBook(Model model,@RequestParam(defaultValue="1")Integer pageNum) {
		PageInfo<Book> pageInfo = bookService.getAllBook(pageNum);
		model.addAttribute("pageInfo",pageInfo);
		return "/admin/book";
	}
	
	@RequestMapping("/getAllBookByType")
	public String getAllBookByType(Model model,@RequestParam(defaultValue="1")Integer pageNum,Integer type) {
		PageInfo<Book> pageInfo = bookService.getAllBookByType(type, pageNum);
		model.addAttribute("type",type);
		model.addAttribute("pageInfo",pageInfo);
		return "/admin/book";
	}
	
	@RequestMapping("/putBook")
	public String putBook(Model model,Integer bid){
		boolean flag = bookService.putBook(bid);
		if(flag) {
			model.addAttribute("msg", "下架成功");
		} else {
			model.addAttribute("msg", "下架失败");
		}
		return "forward:/book/getAllBook";
	}
	
	@RequestMapping("/pushBook")
	public String pushBook(Model model,Integer bid){
		boolean flag = bookService.pushBook(bid);
		if(flag) {
			model.addAttribute("msg", "上架成功");
		} else {
			model.addAttribute("msg", "上架失败");
		}
		return "forward:/book/getAllBook";
	}
	
	@RequestMapping("/addBook")
	public String addBook(@RequestParam MultipartFile bookImg,HttpServletRequest request,Model model,Book book) {
		//创建存储的文件名
		String uuid = FileNameUtil.getUUIDFileName();
        String saveFileName = uuid + FileNameUtil.getFileType(bookImg.getOriginalFilename());        
        //找到存储的路径
        String path  = request.getServletContext().getRealPath("/bookImg");
        System.out.println(path+saveFileName);
        //转存
        try {
        	bookImg.transferTo(new File(path+saveFileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
        book.setUuid(uuid);
        boolean flag = bookService.addBook(book);
        if(flag) {
        	model.addAttribute("msg","添加成功");
        } else {
        	model.addAttribute("msg","添加失败");
        }
        return "/sold/addBook";
	}
	
	@RequestMapping("/getBookByName")
	public String getBookByName(Model model,String name,@RequestParam(defaultValue="1")Integer pageNum) {
		PageInfo<Book> pageInfo = bookService.getBookByName(pageNum, name);
		model.addAttribute("name", name);
		model.addAttribute("pageInfo",pageInfo);
		return "/user/Hall";
	}
	
	@RequestMapping("/readyBuy")
	public String readyBuy(ModelMap model,Integer bid) {
		Book book = bookService.getBookByBid(bid);
		ShopCar shopCar = new ShopCar();
		shopCar.setBook(book);
		List<ShopCar> shopCars = new ArrayList<ShopCar>();
		shopCars.add(shopCar);
		User user = (User) model.get("user");
		List<Address> addresses = addressService.getAllAddress(user.getUid());
		model.addAttribute("shopCars",shopCars);
		model.addAttribute("addresses",addresses);
		return "/user/payment";
	}
	
	@RequestMapping("/getAllBookOfMe")
	public String getAllBookOfMe(ModelMap model,@RequestParam(defaultValue="1")Integer pageNum) {
		User user = (User) model.get("sold");
		PageInfo<Book> pageInfo = bookService.getAllBookOfMe(pageNum,user.getUid());
		model.addAttribute("pageInfo",pageInfo);
		return "/sold/book";
	}
	
	@RequestMapping("/getAllBookByTypeOfMe")
	public String getAllBookByType(ModelMap model,@RequestParam(defaultValue="1")Integer pageNum,Integer type) {
		User user = (User) model.get("sold");
		PageInfo<Book> pageInfo = bookService.getAllBookByTypeOfMe(type, pageNum,user.getUid());
		model.addAttribute("type",type);
		model.addAttribute("pageInfo",pageInfo);
		return "/sold/book";
	}
}
