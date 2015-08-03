package com.teamplanner.repository;

import java.util.HashMap;
import java.util.List;

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
	public int selectMeNotUserNameCheck(int memberNo, String userName) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("memberNo", memberNo);
		params.put("userName", userName);
		
		int result = memberMapper.selectMeNotUserNameCheck(params);
		
		return result;
	}
	
	@Override
	public int selectMemberByNoAndPassByPasswordCheck(int memberNo,
			String password) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("memberNo", memberNo);
		params.put("password", password);
		
		int result = memberMapper.selectMemberByNoAndPassByPasswordCheck(params);
		
		return result;
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


	@Override
	public void updateMember(Member member) {
		memberMapper.updateMember(member);
	}
	@Override
	public List<Member> selectMemberbyMemberName(int memberNo , String text){
		HashMap<Object, Object> params = new HashMap<Object, Object>();
		params.put("memberNo", memberNo);
		params.put("text", text);
		return memberMapper.selectMemberbyMemberName(params);
	}
	@Override
	public List<Member> searchTagAllMember(String key, int memberNo, int boardno) {
		HashMap<Object, Object> params = new HashMap<Object, Object>();
		params.put("key", key);
		params.put("memberNo", memberNo);
		params.put("boardNo", boardno);

		return memberMapper.searchTagAllMember(params);
	}
	
	@Override
	public List<Member> selectTagFriend(int boardNo, int memberNo) {
		HashMap<Object, Object> params = new HashMap<Object, Object>();
		params.put("boardNo", boardNo);
		params.put("memberNo", memberNo);
		return memberMapper.selectTagFriend(params);
	}
}
