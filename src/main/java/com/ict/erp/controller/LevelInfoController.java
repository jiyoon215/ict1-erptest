package com.ict.erp.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ict.erp.service.LevelInfoService;
import com.ict.erp.vo.LevelInfo;

@Controller
public class LevelInfoController {
	
	@Autowired
	private LevelInfoService ls;
	
	/*//이건 내가 만든 select구문
	@RequestMapping(value="/lilist", method=RequestMethod.GET)
	public String getLevel(Model m) {
		m.addAttribute("list",ls.getLevel());
		return "level/levellist";
	}*/
	
	/*@RequestMapping(value="/levelinfo", method=RequestMethod.GET)
	public String getLevelInfoList(Model m) {
		m.addAttribute("list",ls.getLevel(null));
		return "levelinfo/list";
	}*/
	
	/* 파라미터 받아올때1
	@RequestMapping(value="/levelinfo", method=RequestMethod.GET)
	public String getLevelInfoList(Model m,HttpServletRequest req) {
		System.out.println(req.getParameter("liname"));
		m.addAttribute("list",ls.getLevel(null));
		return "levelinfo/list";
	}*/
	
	/*//파라미터 받아올때2
	@RequestMapping(value="/levelinfo", method=RequestMethod.GET)
	public String getLevelInfoList(Model m, @RequestParam Map<String,String> map) {
		System.out.println(map);
		System.out.println(m.toString());
		m.addAttribute("list",ls.getLevel(null));
		return "levelinfo/list";
	}*/
	
	/*//파라미터 받아올때3
	@RequestMapping(value="/levelinfo", method=RequestMethod.GET)
	public String getLevelInfoList(Model m, @RequestParam("liname") String liname) {
		System.out.println(liname);
		System.out.println(m.toString());
		m.addAttribute("list",ls.getLevel(null));
		return "levelinfo/list";
	}*/
	
	/* // 파라미터 받아올때4
	@RequestMapping(value="/levelinfo", method=RequestMethod.GET)
	public String getLevelInfoList(Model m, @ModelAttribute LevelInfo li) {
		System.out.println(li);
		System.out.println(m.toString());
		m.addAttribute("list",ls.getLevel(li));
		return "levelinfo/list";
	}*/
	
	/*//
	@RequestMapping(value="/levelinfo/{linum}", method=RequestMethod.GET)
	public String getLevelInfoList(Model m, @PathVariable int linum, LevelInfo li) {
		System.out.println(linum);
		System.out.println(li);
		System.out.println(m.toString());
		m.addAttribute("list",ls.getLevel(null));
		return "levelinfo/list";
	}*/
	
	/*//model과view를 동시에 하는 것. 선생님 비선호방법
	@RequestMapping(value="/levelinfo2", method=RequestMethod.GET)
	public ModelAndView getLevelInfoList2(ModelAndView mav, @ModelAttribute LevelInfo li) {		
		mav.setViewName("levelinfo/list");
		mav.addObject("liList",ls.getLevel(li));
		return mav;
	}*/
	
	
	//select전체
	@RequestMapping(value="/levelinfo", method=RequestMethod.GET)
	public @ResponseBody List<LevelInfo> getLevelInfoList(@ModelAttribute LevelInfo li) {
		return ls.getLevelList(li);
	}	
	
	//단일select
	@RequestMapping(value="/levelinfo/{linum}", method=RequestMethod.GET)
	public @ResponseBody LevelInfo getLevelInfo(@PathVariable Integer linum) {		
		System.out.println(linum);
		return ls.getLevel(linum);
	}
	
	//insert
	@RequestMapping(value="/levelinfo", method=RequestMethod.POST)
	@ResponseBody
	public int insertLevel(@RequestBody LevelInfo li) {	
		return ls.insertLevel(li);
	}

	//update
	@RequestMapping(value="/levelinfo/{linum}", method=RequestMethod.PUT)
	@ResponseBody
	public Integer updateLevel(@RequestBody LevelInfo li, @PathVariable Integer linum) {
		li.setLinum(linum);
		return ls.updateLevel(li);
	}	
	
	//delete
	@RequestMapping(value="/levelinfo/{linum}", method=RequestMethod.DELETE)
	@ResponseBody
	public String deleteLevel(@PathVariable int linum) {
		return ls.deleteLevel(linum)+"";
	}	
	
	//@ResponsBody -
	//@RequestBody - json형태, xml
	//@pathVariable - param가져오던거랑 비슷하게 
	//@ModelAttribue - post formdata (a=fds, b=fdsa) Get방식이면 ?로
	
	
	@RequestMapping(value="/levelinfo2/{linum}",method=RequestMethod.PUT)
	@ResponseBody 
	public Integer testLevelInfo(@RequestBody LevelInfo li,@PathVariable Integer linum) {
		li.setLinum(linum);
		return ls.testTransaction(li);
	}
	
	@RequestMapping(value="/levelinfo3/{linum}",method=RequestMethod.PUT)
	@ResponseBody 
	public Integer testLevelInfo2(@RequestBody LevelInfo li,@PathVariable Integer linum) {
		li.setLinum(linum);
		return ls.testTransaction2(li);
	}
	
	@RequestMapping(value="/linum", method=RequestMethod.GET)
	public @ResponseBody Integer getLinum() {
		return ls.getLinum();
	}
	
	//insert
	@RequestMapping(value="/levelinfo2", method=RequestMethod.POST)
	@ResponseBody
	public int insertLevelList(@RequestBody List<LevelInfo> li) {	
		return ls.insertLevelList(li);
	}
}
