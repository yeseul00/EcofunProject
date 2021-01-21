﻿package com.study.springboot.repository;

import java.time.LocalDateTime;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.study.springboot.dto.MemberDto;

@Repository
public interface MemberRepository extends JpaRepository<MemberDto, Long> {

	public MemberDto findByMemNo(Long memNo);

	public MemberDto findByMemId(String memId);

	public MemberDto findByMemIdAndMemPw(String memId, String memPw);

	public List<MemberDto> findAllByMemIdLike(String keyword);
	
	public Page<MemberDto> findAll(Pageable pageable);

	@Transactional
	public Long deleteByMemNo(Long memNo);

	public Long countByMemId(String memId);

	public Long countByMemJoinDateBetween(LocalDateTime now, LocalDateTime plusDays);

	/*
	 * @Modifying (clearAutomatically = true, flushAutomatically = true)
	 * 
	 * @Query("UPDATE MemberDto m SET m.memTel=:Tel WHERE m.memNo =:No") public void update(@Param("Tel") String memTel,@Param("No") Long memNo);
	 */
}
