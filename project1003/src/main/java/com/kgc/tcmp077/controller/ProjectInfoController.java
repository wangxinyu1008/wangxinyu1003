package com.kgc.tcmp077.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kgc.tcmp077.pojo.ProjectInfo;
import com.kgc.tcmp077.service.ProjectInfoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author shkstart
 * @create 2020-10-03 15:00
 */
@Controller
public class ProjectInfoController {
    @Resource
    ProjectInfoService projectInfoService;
    @RequestMapping("/")
    public String cha(String status, Model model, @RequestParam(value = "pageNum",required = false)String pageNumPro){
        int pageNum=1;
        if(pageNumPro!=null&&pageNumPro.isEmpty()==false){
            pageNum=Integer.parseInt(pageNumPro);
        }
        int pageSize=3;
        PageHelper.startPage(pageNum,pageSize);
        List<ProjectInfo> projectInfos = projectInfoService.proList(status);
        PageInfo<ProjectInfo> pageInfo=new PageInfo<>(projectInfos);
        model.addAttribute("pageInfo",pageInfo);
        return "index";
    }
    @RequestMapping("/shenhe")
    public String shenhe(Integer id, String projectname, String startdate,String enddate,String status, Model model){
        model.addAttribute("id",id);
        model.addAttribute("projectname",projectname);
        model.addAttribute("startdate",startdate);
        model.addAttribute("enddate",enddate);
        model.addAttribute("status",status);
        return "update";
    }
    @RequestMapping("/update")
    public String update(ProjectInfo projectInfo){
        projectInfoService.updProject(projectInfo);
        return "redirect:/";
    }
}
