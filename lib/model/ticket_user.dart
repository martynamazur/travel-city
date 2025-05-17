class UserTicket{
  final int ticketId;
  final String qrToken;
  final DateTime expiresAt;

  UserTicket(this.ticketId, this.qrToken, this.expiresAt);
}