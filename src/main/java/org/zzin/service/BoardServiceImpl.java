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
    public BoardDTO readPost(Long bno) {
        return boardMapper.select(bno).toBoardDTO();
    }

    @Override
    public String registerPost(BoardDTO dto) {
        int result = boardMapper.insert(dto.toBoardVO());
        return (result>0) ? "성공":"실패";
    }

    @Override
    public String deletePost(BoardDTO dto) {
        int result = boardMapper.delete(dto.getBno());
        return (result>0) ? "성공" : "실패";
    }

    @Override
    public String modifyPost(BoardDTO dto) {
        int result = boardMapper.update(dto.toBoardVO());

        return (result >0 ) ? "성공" : "실패";
    }
}
