package org.zzin.mapper;

import org.springframework.stereotype.Repository;
import org.zzin.domain.BoardVO;

@Repository
public interface BoardMapper extends CRUD<BoardVO, Long> {


}
