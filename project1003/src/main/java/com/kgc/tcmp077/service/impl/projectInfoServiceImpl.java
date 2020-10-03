package com.kgc.tcmp077.service.impl;

import com.kgc.tcmp077.mapper.projectInfoMapper;
import com.kgc.tcmp077.pojo.ProjectInfo;
import com.kgc.tcmp077.pojo.ProjectInfoExample;
import com.kgc.tcmp077.service.ProjectInfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author shkstart
 * @create 2020-10-03 14:55
 */
@Service("")
public class projectInfoServiceImpl implements ProjectInfoService {
    @Resource
    projectInfoMapper projectInfoMapper;

    @Override
    public List<ProjectInfo> proList(String status) {
        ProjectInfoExample projectInfoExample=new ProjectInfoExample();
        ProjectInfoExample.Criteria criteria = projectInfoExample.createCriteria();
        if(status!=null&&status.equals("3")==false){
            criteria.andStatusEqualTo(Integer.valueOf(status));
            projectInfoExample.setOrderByClause("id desc");
            return projectInfoMapper.selectByExample(projectInfoExample);
        }else{
            projectInfoExample.setOrderByClause("id desc");
            return projectInfoMapper.selectByExample(projectInfoExample);
        }
    }

    @Override
    public void updProject(ProjectInfo projectInfo) {
        projectInfoMapper.updateByPrimaryKeySelective(projectInfo);
    }
}
