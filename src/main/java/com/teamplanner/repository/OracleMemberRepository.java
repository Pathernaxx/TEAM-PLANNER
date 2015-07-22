package com.teamplanner.repository;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.teamplanner.dto.Member;
import com.teamplanner.mapper.MemberMapper;

@Repository(value="memberRepository")
public class OracleMemberRepository implements MemberRepository{

	
	private MemberMapper memberMapper;

	@Autowired
	@Qualifier("memberMapper")
	public void setMemberMapper(MemberMapper memberMapper){
		this.memberMapper=memberMapper;
	}
	
	
	@Override
	public void insertMember(Member member) {
		
		memberMapper.insertMember(member);
	}

	@Override
	public String selectMemberByUserNameCheck(String userName) {
		
		
		return memberMapper.selectMemberByUserNameCheck(userName);
	}

	@Override
	public String selectMemberByEmailCheck(String email) {
		// TODO Auto-generated method stub
		return memberMapper.selectMemberByEmailCheck(email);
	}

	@Override
	public Member selectMemberByMemberNo(int memberNo) {
		// TODO Auto-generated method stub
		return memberMapper.selectMemberByMemberNo(memberNo);
	}

	@Override
	public void updateMember(Member member) {
		memberMapper.updateMember(member);
		
	}

	@Override
	public Member selectMemberByIdAndPasswordByEmail(String email, String password) {
		HashMap<String, String> params = new HashMap<String, String>();
		
		params.put("email", email);
		params.put("password", password);
		
		return memberMapper.selectMemberByIdAndPasswordByEmail(params);
	}
	
	@Override
	public Member selectMemberByIdAndPasswordByName(String name, String password) {
		HashMap<String, String> params = new HashMap<String, String>();
		
		params.put("name", name);
		params.put("password", password);
		
		return memberMapper.selectMemberByIdAndPasswordByName(params);
	}
}
