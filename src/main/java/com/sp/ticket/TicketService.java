package com.sp.ticket;

import java.util.List;
import java.util.Map;

public interface TicketService {
	public List<Ticket> listTicket(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
}
