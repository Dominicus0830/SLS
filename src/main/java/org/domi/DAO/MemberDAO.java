package org.domi.DAO;

import org.springframework.jdbc.core.*;
import java.util.*;
import org.springframework.stereotype.*;

import javax.sql.*;

import org.domi.DTO.*;

@Component
public class MemberDAO {
	//왜 멤버 관리자 등록이 안됨???ㅇㅁㅇㄴㅇㅁㅇㄴㅁㅇㅁㅇㅁㄴ
	//아몰라 방치해


	private MemberDTO memberDTO;
	private JdbcTemplate jdbcTemplate;

	public MemberDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public MemberDTO selectByEmail(String inputEmail) {
		// 이메일로 회원 가져오기
		try {
			return this.jdbcTemplate.queryForObject("SELECT * FROM MEMBER WHERE EMAIL=?;",
					(rs, rowNum) -> new MemberDTO(rs.getString("EMAIL"), rs.getString("PASSWORD"), rs.getString("NAME"),
							rs.getInt("RANK"), rs.getInt("NORMAL_RETURN"), rs.getInt("RETURN_AVAILABLE")),
					inputEmail);
		} catch (Exception ex) {
			return null;
		}
	}

	public List<MemberDTO> showAll() {
		// 전체 회원 조회
		List<MemberDTO> result = jdbcTemplate.query("SELECT * FROM MEMBER;", (rs, rowNum) -> {
			MemberDTO memberDTO = new MemberDTO(rs.getString("EMAIL"), rs.getString("PASSWORD"), rs.getString("NAME"),
					rs.getInt("RANK"), rs.getInt("NORMAL_RETURN"), rs.getInt("RETURN_AVAILABLE"));
			return memberDTO;
		});
		return result;
	}

	public List<MemberDTO> showBlack() {
		// 블랙리스트 조회
		List<MemberDTO> result = jdbcTemplate.query("SELECT * FROM MEMBER WHERE RANK=-1;", (rs, rowNum) -> {
			MemberDTO memberDTO = new MemberDTO(rs.getString("EMAIL"), rs.getString("PASSWORD"), rs.getString("NAME"),
					rs.getInt("RANK"), rs.getInt("NORMAL_RETURN"), rs.getInt("RETURN_AVAILABLE"));
			return memberDTO;
		});
		return result;
	}

	public void insertMember(MemberDTO _memberDTO) {
		// 회원 추가
		this.memberDTO = _memberDTO;

		jdbcTemplate.update("INSERT INTO MEMBER(EMAIL, PASSWORD, NAME) VALUES('" + memberDTO.getMemberEmail() + "', '"
				+ memberDTO.getMemberPassword() + "', '" + memberDTO.getMemberName() + "');");
	}

	public void updatePassword(MemberDTO _memberDTO, String newPassword) {
		// 비밀번호 업데이트
		this.memberDTO = _memberDTO;

		jdbcTemplate.update(
				"UPDATE MEMBER SET PASSWORD='" + newPassword + "' WHERE EMAIL='" + memberDTO.getMemberEmail() + "';");
	}

	public void updateRank(MemberDTO memberDTO, int newRank) {
		// 랭크 설정
		if (newRank == 1)
			jdbcTemplate.update("UPDATE MEMBER SET RANK=" + newRank + ", RETURN_AVAILABLE="
					+ memberDTO.getMemberReturnAvailable() + "+2 WHERE EMAIL='" + memberDTO.getMemberEmail() + "';");
		else if (newRank == 0)
			jdbcTemplate.update("UPDATE MEMBER SET RANK=" + newRank + ", RETURN_AVAILABLE=3 WHERE EMAIL='"
					+ memberDTO.getMemberEmail() + "';");
		else
			jdbcTemplate.update("UPDATE MEMBER SET RANK=" + newRank + ", RETURN_AVAILABLE=-1 WHERE EMAIL='"
					+ memberDTO.getMemberEmail() + "';");
	}

	public void updateMemberReturnAvailable(MemberDTO _memberDTO) {
		this.memberDTO = _memberDTO;

		jdbcTemplate.update("UPDATE MEMBER SET RETURN_AVAILABLE=" + memberDTO.getMemberReturnAvailable()
				+ " WHERE EMAIL='" + memberDTO.getMemberEmail() + "';");
	}

	public void updateMemberNormalReturn(MemberDTO _memberDTO) {
		this.memberDTO = _memberDTO;

		jdbcTemplate.update("UPDATE MEMBER SET NORMAL_RETURN=" + memberDTO.getMemberNormalReturn() + " WHERE EMAIL='"
				+ memberDTO.getMemberEmail() + "';");
	}

	public void deleteMember(MemberDTO member) {

	}
}