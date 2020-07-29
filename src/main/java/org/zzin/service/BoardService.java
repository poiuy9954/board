package org.zzin.service;

import org.zzin.domain.BoardVO;
import org.zzin.dto.BoardDTO;

import java.util.*;

public interface BoardService {

    public List<Map<String,String>> getList();

    public BoardDTO readPost(Long bno);

    public String registerPost(BoardDTO dto);

    public String deletePost(BoardDTO dto);

    public String modifyPost(BoardDTO dto);

}
