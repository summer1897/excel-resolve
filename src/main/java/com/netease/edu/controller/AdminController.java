package com.netease.edu.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.netease.edu.service.DataResolverService;
import com.netease.edu.util.FilePathUitl;

/**
 *
 * @Description: admin controller
 * @author hzduhao
 * @Date 2016年5月28日
 *
 */
@Controller
public class AdminController {
	
	@Autowired
	private DataResolverService service;

	@RequestMapping("/admin/{viewName}")
	public String dispatcher(@PathVariable String viewName){
		return "/admin/"+viewName;
	}
	
	@RequestMapping("/admin.html")
	public String admin(HttpServletRequest request){
		return "/admin/admin";
	}
	
	@RequestMapping("/admin/dbsource/settings.html")
	public String dbSourceSetting(){
//		System.out.println("setting");
		return "/admin/dbsource-settings";
	}
	
	@RequestMapping(value="/admin/dbsource/upload.html",method=RequestMethod.GET)
	public String upload(){
		return "/admin/add";
	}
	
	@RequestMapping(value="/admin/dbsource/upload.html",method=RequestMethod.POST)
	public void upload(MultipartFile uploadFile,
						HttpServletRequest request,
					HttpServletResponse response){
//		Map<String,Object> result = new HashMap<String,Object>();
		String msg = "上传失败!";
		String fileName = uploadFile.getOriginalFilename();
		System.out.println("fileName: "+fileName);
		Path savePath = Paths.get(FilePathUitl.getRootPath(request, FilePathUitl.SAVE_FILE_DIR) + fileName);
		request.getSession().setAttribute("fileName", fileName);
		long flag = -1;
		try {
			flag = Files.copy(uploadFile.getInputStream(), savePath);
			if(-1 != flag){
				msg = "上传成功!";
			}
			response.getOutputStream().write(JSON.toJSONString(msg).getBytes("UTF-8"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("/admin/dbsource/readData.html")
	public String readData(HttpServletRequest request,
						   Model model){
		System.out.println("read data");
		String fileName = request.getSession().getAttribute("fileName").toString();
		String path = FilePathUitl.getRootPath(request, FilePathUitl.SAVE_FILE_DIR) + fileName;
		
		List<String> title = service.readTitle(path);
		List<ArrayList<Object>> cells = service.readData(path);
		
		model.addAttribute("title", title);
		model.addAttribute("cells", cells);
		return "/admin/read-data";
	}
	
}
