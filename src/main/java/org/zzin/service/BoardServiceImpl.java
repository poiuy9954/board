package org.zzin.service;

import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zzin.dto.BoardDTO;
import org.zzin.mapper.BoardMapper;

import java.util.List;
import java.util.Map;

@Service
public class BoardServiceImpl implements BoardService{

    @Autowired
    private BoardMapper boardMapper;

    @Override
    public List<Map<String, String>> getList() {
        return boardMapper.getList();
    }

    @Override
    public String readPost(BoardDTO dto) {
        return null;
    }

    @Override
    public String registerPost(BoardDTO dto) {
        return null;
    }

    @Override
    public String deletePost(BoardDTO dto) {
        return null;
    }

    @Override
    public String modifyPost(BoardDTO dto) {
        return null;
    }
}
