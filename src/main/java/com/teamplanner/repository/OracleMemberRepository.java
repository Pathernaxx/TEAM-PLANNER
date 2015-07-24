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
	public void updateMemberName(Member member) {
		memberMapper.updateMemberName(member);
	}
	

	@Override
	public void updateMemberNotification(int memberNo, boolean notification) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("memberNo", memberNo);
		params.put("notification", notification);
		
		memberMapper.updateMemberNotification(params);
		
	}


	@Override
	public void updateMemberIconPath(String iconpath, int memberNo) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("memberNo", memberNo);
		params.put("iconpath", iconpath);
		
		memberMapper.updateMemberIconPath(params);
	}


	@Override
	public void updateMemberPassword(String password, int memberNo) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("memberNo", memberNo);
		params.put("password", password);
		
		memberMapper.updateMemberPassword(params);
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


	@Override
	public Member updateMemberView(int memberNo) {
		// TODO Auto-generated method stub
		
		return memberMapper.updateMemberView(memberNo);
	}
}
