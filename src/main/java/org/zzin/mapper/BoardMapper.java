package org.zzin.mapper;

import org.springframework.stereotype.Repository;
import org.zzin.domain.BoardVO;
import org.zzin.dto.PageDTO;

import java.util.List;
import java.util.Map;

@Repository
public interface BoardMapper extends CRUD<BoardVO, Long> {


    public List<Map<String,String>> getList(PageDTO pageDTO);

    public int getTotal(PageDTO pageDTO);
}
