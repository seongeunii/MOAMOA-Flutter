import '../domain/entities/settlement.dart';

String won(int amount) =>
    '${amount.toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (_) => ',')}원';

String shortDate(DateTime date) {
  final local = date.toLocal();
  return '${local.month}월 ${local.day}일';
}

String paymentStatusLabel(PaymentStatus? status) => switch (status) {
  PaymentStatus.unpaid => '미납',
  PaymentStatus.pending => '확인 대기',
  PaymentStatus.paid => '완납',
  PaymentStatus.refunded => '환불됨',
  _ => '상태 확인 필요',
};

String settlementStatusLabel(SettlementStatus status) => switch (status) {
  SettlementStatus.inProgress => '진행 중',
  SettlementStatus.completed => '완료',
  SettlementStatus.canceled => '취소됨',
  SettlementStatus.unknown => '상태 확인 필요',
};

String regularDuesCycleLabel(DuesCycle cycle, String day) {
  if (cycle == DuesCycle.monthly) {
    return day == 'LAST' ? '매월 말일' : '매월 $day일';
  }
  const weekdays = {
    'MON': '월요일',
    'TUE': '화요일',
    'WED': '수요일',
    'THU': '목요일',
    'FRI': '금요일',
    'SAT': '토요일',
    'SUN': '일요일',
  };
  return cycle == DuesCycle.weekly ? '매주 ${weekdays[day] ?? day}' : '주기 확인 필요';
}
