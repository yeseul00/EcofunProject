﻿package com.study.springboot.repository;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.study.springboot.dto.ImgDto;

@Repository
public interface ImgRepository extends JpaRepository<ImgDto, Long> {
	public Page<ImgDto> findAll(Pageable pageable);

	public Optional<ImgDto> findByProNo(Long proNo);
}
