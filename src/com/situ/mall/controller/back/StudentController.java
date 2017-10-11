package com.situ.mall.controller.back;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.situ.mall.pojo.Banji;
import com.situ.mall.pojo.Student;
import com.situ.mall.service.IStudentService;
import com.situ.mall.vo.PageBean;
import com.situ.mall.vo.SearchCondition;

@Controller
@RequestMapping("/student")
public class StudentController {
	@Resource(name="studentService")
	private IStudentService studentService;

	@RequestMapping("/findAll")
	public String findAll(Model model) {
		List<Student> list = studentService.findAll();
		model.addAttribute("list", list);
		for (Student student : list) {
			System.out.println(student);
		}
		return "student_list";
	}
	
	
	@RequestMapping(value="/findPageBeanList")
	private ModelAndView findPageBeanList( Integer pageIndex, String pageSizeStr){
		
		System.out.println(pageIndex);
		if (pageIndex == null) {
			pageIndex = 1;
		}
		int pageSize = 3;//默认每一页数�?
		if (pageSizeStr != null && !pageSizeStr.equals("")) {
			pageSize = Integer.parseInt(pageSizeStr);
		}
		PageBean pageBean = (PageBean) studentService.getPageBean(pageIndex, pageSize);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pageBean",pageBean);
		modelAndView.setViewName("student_list");
		return modelAndView;
	}
	
	/*@RequestMapping("/searchByCondition")
	private ModelAndView searchByCondition(String name,String age,String gender,String banji, String pageIndex,String pageSize){
		int pageIndexInt = 1;
		if (pageIndex != null && !pageIndex.equals("")) {
			pageIndexInt = Integer.parseInt(pageIndex);
		}
		int pageSizeInt = 3;
		if (pageSize != null && !pageSize.equals("")) {
			pageSizeInt = Integer.parseInt(pageSize);
		}
		SearchCondition searchCondition = new SearchCondition(pageIndexInt, pageSizeInt, name, age, gender,banji);
		System.out.println(searchCondition);
		
		//2.璋冪敤service瀹屾垚涓氬姟澶勭�?
		//IStudentService service = new StudentServiceImpl();
		PageBean<Student> pageBean = studentService.searchByCondition(searchCondition);
		System.out.println(pageBean);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pageBean",pageBean);
		modelAndView.addObject("searchCondition",searchCondition);
		modelAndView.setViewName("student_list");
		return modelAndView;
	}*/
	
		
	
	@RequestMapping("/deletById")
	public String deletById(int id) {
		studentService.deletById(id);
		return "forward:/student/findPageBeanList.action?pageIndex=1";
	}
	
	@RequestMapping(value="/addStudentServlet",method={RequestMethod.GET,RequestMethod.POST})
	public String addStduentServlet(Model model,String name,int age,String gender,String address,Banji banji){
		Student student = new Student();
        student.setAge(age);
        student.setGender(gender);
        student.setName(name);
        student.setAddress(address);
		student.setBanji(banji);
		studentService.add(student);
		return "forward:/student/findPageBeanList.action?pageIndex=1";

		
	}
	
	@RequestMapping("/findAllBanji")
	public String findAllBanji(Model model) {
		List<Banji> list = studentService.findAllBanji();
		model.addAttribute("list", list);
		for (Banji banji : list) {
			System.out.println(banji);
		}
		return "student_list";
	}
	
	@RequestMapping(value="/getAddPage", method={RequestMethod.GET, RequestMethod.POST})
	public String getAddPage(Model model){
		List<Banji> list = studentService.findAllBanji();
		model.addAttribute("list", list);
		return "add_student";
	}
	
	@RequestMapping(value="/toUpdateStudentServlet",method={RequestMethod.GET,RequestMethod.POST})
	public String toUpdateStudentServlet(Model model,int id){
		Student student = studentService.selectById(id);
		System.out.println(student);
		model.addAttribute("student", student);
		return "student_update";
	}

	@RequestMapping(value="/updateStudentServlet",method={RequestMethod.GET,RequestMethod.POST})
	public String updateStudentServlet(Student student){
		
		studentService.update(student);
		return "forward:/student/findPageBeanList.action";
	}
	
	
	
	@RequestMapping(value="/getSearchPage", method={RequestMethod.GET, RequestMethod.POST})
	public String getSearchPage(Model model){
		List<Banji> list = studentService.findAllBanji();
		model.addAttribute("banji", list);
		return "student_search";
	}
	
	
	@RequestMapping(value="/searchByCondition", method={RequestMethod.GET, RequestMethod.POST})
	public String searchByCondition(Model model,Student student){
		List<Student> list = studentService.searchByCondition(student);
		model.addAttribute("list",list);
		model.addAttribute("banji",list);
		for (Student stu : list) {
			System.out.println(stu);
		} 
		return "student_search";

	}
	
	

}
