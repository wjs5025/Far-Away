package com.ssafy.attraction.info.model.service;

import com.ssafy.attraction.info.model.dto.AttractionInfoDto;
import com.ssafy.util.PageNavigation;

import java.util.List;
import java.util.Map;

public interface AttractionInfoService {
    public List<AttractionInfoDto> getAttractionInfoList(Map<String, String> map) throws Exception;
    PageNavigation makePageNavigation(Map<String, String> map) throws Exception;
}
