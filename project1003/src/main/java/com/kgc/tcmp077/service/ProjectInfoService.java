package com.kgc.tcmp077.service;

import com.kgc.tcmp077.pojo.ProjectInfo;

import java.util.List;

/**
 * @author shkstart
 * @create 2020-10-03 14:54
 */
public interface ProjectInfoService {
    List<ProjectInfo> proList(String status);
    void updProject(ProjectInfo projectInfo);
}
