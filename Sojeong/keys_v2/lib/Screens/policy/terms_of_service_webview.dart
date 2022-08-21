import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart' show JavascriptChannel, JavascriptMode, WebView, WebViewController;

class TermsOfServiceWithWebview extends StatelessWidget {
  TermsOfServiceWithWebview({Key key}) : super(key: key);
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  WebViewController _webViewController;

  String htmlTerms = '''
  <!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link href="/media/static/css/rules.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<style>
body {
font-family: 留묒�怨좊뵓, "malgun gothic", �뗭�, Dotum, "Apple SD Gothic Neo", Helvetica, sans-serif;
}
html,body,div,ul,li,table,th,td,caption{
  padding: 0;
  margin: 0;
}
ul, li {
  list-style: none;
}
body{
  -ms-overflow-style: none;
  overflow: auto;
}
table {
  border-collapse: collapse;
}
table caption {
  display: none;
}
table.section {
  width: 100%;
  margin: 5px 0;
  border: 1px solid #222;
  box-sizing: border-box;
}
table.section th {
  height: 50px;
  padding: 0 5px;
  text-align: center;
  background-color: rgb(238, 238, 238);
  border: 1px solid #222;
  font-size: 12px;
  letter-spacing: -1px;
}
table.section td {
  height: 50px;
  padding: 0 5px;
  text-align: left;
  border: 1px solid #222;
  font-size: 12px;
}
::-webkit-scrollbar {
display: none;
}
.btn_agency {
  color: #333;
  text-decoration: underline;
}
.tabs-menu {
  overflow: hidden;
  border-left: 1px solid #ccc;
}
.tabs-menu li {
  width: 20%;
  float: left;
  background-color: #fafafa;
  border-top: 1px solid #ccc;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
.tabs-menu li.current {
  position: relative;
  background-color: #fff;
  border-bottom: 1px solid #fff;
  z-index: 5;
}
.tabs-menu li a {
  display: block;
  height: 58px;
  text-align: center;
  line-height: 1.2;
  text-transform: uppercase;
  color: #333;
  font-weight: bold;
  text-decoration: none;
  padding-top: 21px;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
.tabs-menu .current a {
  color: #666;
}
.tab {
  background-color: #fff;
  width: 100%;
  box-sizing: border-box;
}
#tabs-container {
  margin: 10px;
}
.tab-content {
  border: 1px solid #d4d4d1;
  border-top: none;
  padding: 20px;
  display: none;
}
#tab-1 {
 display: block;
}
.tit {
  color: #333;
  font-size: 16px;
  padding: 9px 0 0 0px;
  margin: 0 0 5px 0;
  font-weight: bold;
  text-align: center;
}
.stit {
  color: #222;
  font-size: 13px;
  padding: 5px 0 0 0;
  font-weight: bold;
}
.item {
  color: #222;
  font-size: 12px;
  padding: 5px 17px 0 17px;
  line-height: 20px;
  margin: 0 0 30px 0;
}
.sitem {
  padding-left: 13px;
}
.sitem a {
  color: #333;
}
.sitem1 {
  padding-left: 26px;
}
.tab-content li {
  text-align: justify;
}
.tabs-menu span {
  display: inline;
  font-size: 14px;
}
@media (max-width: 980px) {
  .tabs-menu span {
    display: block;
    font-size: 11px;
  }
  .tabs-menu li a {
    padding-top: 10px;
  }
  .tabs-menu li:first-child a {
    padding-top: 21px;
  }
  .tabs-menu li:nth-child(2) a {
    padding-top: 16px;
  }
}
select {
  padding: .8em .9em;
  font-family: inherit;
  font-size: 14px;
  color: #333;
  background: url(/media/images/ic_arrow.png) no-repeat 95% 50%;
  background-size: 24px;
  border: 1px solid #999;
  border-radius: 0px;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  height: 40px;
  margin: 20px 0;
}
.select1 {
  width: 170px;
}
.select2 {
  width: 230px;
}
iframe {
  border: none;
  margin: 0;
}
select::-ms-expand { display: none; }
</style>
</head>
<body>
  <div class="tit">전자금융거래 이용약관</div>
  <div class="stit">제1조 (목적)</div>
  <div class="item">
    <ul>
      <li>이 약관은 주식회사 위대한상상(이하 '회사'라 합니다)이 제공하는 전자지급결제대행서비스를 이용자가 이용함에 있어 회사와 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함을 목적으로 합니다.</li>
    </ul>
  </div>
  <div class="stit">제2조 (용어의 정의)</div>
  <div class="item">
    <ul>
      <li>① 이 약관에서 정하는 용어의 정의는 다음 각 호와 같습니다.</li>
      <li class="sitem">1. '전자금융거래'라 함은 회사가 전자적 장치를 통하여 전자지급결제대행서비스 (이하 '전자금융거래 서비스'라고 합니다)를 제공하고, 이용자가 회사의 종사자와 직접 대면하거나 의사소통을 하지 아니하고 자동화된 방식으로 이를 이용하는 거래를 말합니다.</li>
      <li class="sitem">2. '전자지급수단'이라 함은 전자자금이체, 직불전자지급수단, 선불전자지급수단, 전자화폐, 신용카드, 전자채권 그 밖에 전자적 방법에 따른 지급 수단을 말합니다.</li>
      <li class="sitem">3. '전자지급결제대행서비스'라 함은 전자적 방법으로 재화의 구입 또는 용역의 이용에 있어서 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 서비스를 말합니다.</li>
      <li class="sitem">4. '이용자'라 함은 이 약관에 동의하고 '회사'가 제공하는 전자금융거래 서비스를 이용하는 자를 말합니다.</li>
      <li class="sitem">5. '접근매체'라 함은 전자금융거래에 있어서 거래지시를 하거나 '이용자' 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함한다), '전자서명법'상의 인증서, '회사'에 등록된 '이용자'번호, '이용자'의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등 전자금융거래법 제2조 제10호에서 정하고 있는 것을 말합니다.</li>
      <li class="sitem">6. '거래지시'라 함은 '이용자'가 본 약관에 의하여 체결되는 전자금융거래계약에 따라 '회사'에 대하여 전자금융거래의 처리를 지시하는 것을 말합니다.</li>
      <li class="sitem">7. '오류'라 함은 '이용자'의 고의 또는 과실 없이 전자금융거래가 전자금융거래계약 또는 '이용자'의 거래지시에 따라 이행되지 아니한 경우를 말합니다.</li>
      <li class="sitem">8. '정보통신망'이라 함은 전기통신설비를 이용하거나 전기통신설비와 컴퓨터 및 컴퓨터의 이용기술을 활용하여 정보를 수집·가공·검색·송신 또는 수신하는 정보통신체제를 말합니다.</li>
      <li>② 본 조 및 본 약관의 다른 조항에서 정의한 것을 제외하고는 전자금융거래법등 관계 법령에 따릅니다.</li>
    </ul>
  </div>
  <div class="stit">제3조 (약관의 명시 및 변경)</div>
  <div class="item">
    <ul>
      <li>① 회사는 이용자가 전자금융거래 서비스를 이용하기 전에 이 약관을 게시하고 이용자가 이 약관의 중요한 내용을 확인할 수 있도록 합니다.</li>
      <li>② 회사는 이용자의 요청이 있는 경우 전자문서의 전송방식에 의하여 본 약관의 사본을 이용자에게 교부합니다.</li>
      <li>③ 회사가 약관을 변경하는 때에는 그 시행일 1개월 전에 변경되는 약관을 회사가 제공하는 전자금융거래 서비스 이용 초기화면 및 회사의 홈페이지에 게시함으로써 이용자에게 공지합니다.</li>
      <li>④ 법령의 개정으로 인하여 긴급하게 약관을 변경한 때에는 변경된 약관을 전자금융거래 서비스 이용 초기화면 및 회사의 홈페이지에 최소 1월 이상 게시하고 이용자에게 통지합니다.</li>
      <li>⑤ 회사가 제3항의 공지를 할 경우, “이용자가 변경 내용에 동의하지 않는 경우, 공지한 날로부터 1개월(공지기간)이내에 계약을 해지할 수 있으며, 계약해지의 의사표시를 하지 아니한 경우에는 변경에 동의한 것으로 본다”라는 취지의 내용을 고지하거나 통지합니다.</li>
    </ul>
  </div>
  </div>
  <div class="stit">제4조 (전자지급결제대행서비스의 종류)</div>
  <div class="item">
    <ul>
      <li>회사가 제공하는 전자지급결제대행서비스는 지급결제수단에 따라 다음과 같이 구별됩니다.</li>
      <li class="sitem">1. 신용카드결제대행서비스: 이용자가 결제대금의 지급을 위하여 제공한 지급결제수단이 신용카드인 경우로서, 회사가 전자결제시스템을 통하여 신용카드 지불정보를 송·수신하고 결제대금의 정산을 대행하거나 매개하는 서비스를 말합니다.</li>
      <li class="sitem">2. 계좌이체대행서비스: 이용자가 결제대금을 회사의 전자결제시스템을 통하여 금융기관에 등록한 자신의 계좌에서 출금하여 원하는 계좌로 이체할 수 있는 실시간 송금 서비스를 말합니다.</li>
      <li class="sitem">3. 가상계좌서비스: 이용자가 결제대금을 현금으로 결제하고자 경우 회사의 전자결제시스템을 통하여 자동으로 이용자만의 고유한 일회용 계좌의 발급을 통하여 결제대금의 지급이 이루어지는 서비스를 말합니다.</li>
      <li class="sitem">4. 기타: 회사가 제공하는 서비스로서 지급결제수단의 종류에 따라, 'ARS결제대행서비스', '상품권결제대행서비스'등이 있습니다.</li>
    </ul>
  </div>
  </div>
  <div class="stit">제5조 (이용시간)</div>
  <div class="item">
    <ul>
      <li>① 회사는 이용자에게 연중무휴 1일 24시간 전자금융거래 서비스를 제공함을 원칙으로 합니다. 단, 금융기관 기타 결제수단 발행업자의 사정에 따라 달리 정할 수 있습니다.</li>
      <li>② 회사는 정보통신설비의 보수, 점검 기타 기술상의 필요나 금융기관 기타 결제수단 발행업자의 사정에 의하여 서비스 중단이 불가피한 경우, 서비스 중단 3일 전까지 게시가능한 전자적 수단을 통하여 서비스 중단 사실을 게시한 후 서비스를 일시 중단할 수 있습니다. 다만, 시스템 장애복구, 긴급한 프로그램 보수, 외부요인 등 불가피한 경우에는 사전 게시없이 서비스를 중단할 수 있습니다.</li>
    </ul>
  </div>
  </div>
  <div class="stit">제6조 (접근매체의 선정과 사용 및 관리)</div>
  <div class="item">
    <ul>
      <li>① 회사는 전자금융거래 서비스 제공 시 접근매체를 선정하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인할 수 있습니다.</li>
      <li>② 이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없습니다.</li>
      <li>③ 이용자는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.</li>
      <li>④ 회사는 이용자로부터 접근매체의 분실이나 도난 등의 통지를 받은 때에는 그 때부터 제3자가 그 접근매체를 사용함으로 인하여 이용자에게 발생한 손해를 배상할 책임이 있습니다.</li>
    </ul>
  </div>
  </div>
  <div class="stit">제7조 (거래내용의 확인)</div>
  <div class="item">
    <ul>
      <li>① 회사는 이용자와 미리 약정한 전자적 방법을 통하여 이용자의 거래내용(이용자의 '오류정정 요구사실 및 처리결과에 관한 사항'을 포함합니다)을 확인할 수 있도록 하며, 이용자의 요청이 있는 경우에는 요청을 받은 날로부터 2주 이내에 모사전송 등의 방법으로 거래내용에 관한 서면을 교부합니다.</li>
      <li>② 회사가 이용자에게 제공하는 거래내용 중 거래계좌의 명칭 또는 번호, 거래의 종류 및 금액, 거래상대방을 나타내는 정보, 거래일자, 전자적 장치의 종류 및 전자적 장치를 식별할 수 있는 정보와 해당 전자금융거래와 관련한 전자적 장치의 접속기록은 5년간, 건당 거래금액이 1만원 이하인 소액 전자금융거래에 관한 기록, 전자지급수단 이용시 거래승인에 관한 기록, 이용자의 오류정정 요구사실 및 처리결과에 관한 사항은 1년간의 기간을 대상으로 합니다.</li>
      <li>③ 이용자가 제1항에서 정한 서면교부를 요청하고자 할 경우 다음의 주소 및 전화번호로 요청할 수 있습니다.</li>
      <li class="sitem">주소: 서울 서초구 서초대로38길 12, 17층(서초동, 마제스타시티타워투)</li>
      <li class="sitem">이메일 주소: support@yogiyo.co.kr</li>
      <li class="sitem">전화번호: 1661-5270</li>
    </ul>
  </div>
  </div>
  <div class="stit">제8조 (오류의 정정 등)</div>
  <div class="item">
    <ul>
      <li>① 이용자는 전자금융거래 서비스를 이용함에 있어 오류가 있음을 안 때에는 회사에 대하여 그 정정을 요구할 수 있습니다.</li>
      <li>② 회사는 전항의 규정에 따른 오류의 정정요구를 받은 때 또는 회사 스스로 전자금융거래 서비스의 오류가 있음을 안 때에는 이를 즉시 조사하여 처리한 후 정정요구를 받은 날 또는 오류가 있음을 안 날부터 2주 이내에 그 결과를 이용자에게 알려 드립니다.</li>
    </ul>
  </div>
  </div>
  <div class="stit">제9조 (회사의 책임)</div>
  <div class="item">
    <ul>
      <li>① '회사'는 다음 각 호의 사유 발생으로 인하여 '이용자'에게 손해가 발생하였을 경우 이에 대한 배상책임이 있습니다.</li>
      <li class="sitem">1. 접근매체의 위조나 변조로 발생한 사고</li>
      <li class="sitem">2. 계약체결 또는 거래지시의 전자적 전송이나 처리 과정에서 발생한 사고</li>
      <li class="sitem">3. 전자금융거래를 위한 전자적 장치 또는 ‘정보통신망’에 침입하여 거짓이나 그 밖의 부정한 방법으로 획득한 접근매체의 이용으로 발생한 사고</li>
      <li>② 본 조 제1항에도 불구하고 다음 각 호의 사유로 발생한 사고에 대해선, 그 책임의 전부 또는 일부를 '이용자'가 부담합니다.</li>
      <li class="sitem">1. 법인('중소기업기본법' 제2조 제2항에 의한 소기업을 제외합니다)인 '이용자'에게 손해가 발생한 경우로서 '회사'가 사고를 방지하기 위하여 보안절차를 수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의의무를 다한 경우</li>
      <li class="sitem">2. '이용자'가 제7조 제2항을 위반하여 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공한 경우</li>
      <li class="sitem">3. 제3자가 권한 없이 '이용자'의 접근매체를 이용하여 전자금융거래를 할 수 있음을 알았거나 알 수 있었음에도 불구하고 '이용자'가 자신의 접근매체를 누설 또는 노출하거나 방치한 경우</li>
      <li class="sitem">4. 제6조 제1항의 따른 확인 외에 보안강화를 위하여 전자금융거래 시 '회사'가 요구하는 추가적인 보안조치를 요구하였음에도 불구하고 '이용자'가 정당한 사유 없이 이를 거부하여 '회사'의 정보통신망에 침입하여 거짓이나 그 밖의 부정한 방법으로 사고가 발생한 경우</li>
      <li class="sitem">5. 이용자가 제3호에 따른 추가적인 보안조치에 사용되는 접근매체에 대하여 다음 각 목의 어느 하나에 해당하는 행위를 하여 '회사'의 정보통신망에 침입하여 거짓이나 그 밖의 부정한 방법으로 사고가 발생한 경우</li>
      <li class="sitem1">가. 누설·노출 또는 방치한 행위</li>
      <li class="sitem1">나. 제3자에게 대여하거나 그 사용을 위임한 행위 또는 양도나 담보의 목적으로 제공한 행위</li>
    </ul>
  </div>
  </div>
  <div class="stit">제10조 (전자지급거래계약의 효력)</div>
  <div class="item">
    <ul>
      <li>① 회사는 이용자의 거래지시가 전자지급거래에 관한 경우 그 지급절차를 대행하며, 전자지급거래에 관한 거래지시의 내용을 전송하여 지급이 이루어지도록 합니다.</li>
      <li>② 회사는 이용자의 전자지급거래에 관한 거래지시에 따라 지급거래가 이루어지지 않은 경우 수령한 자금을 이용자에게 반환하여야 합니다.</li>
    </ul>
  </div>
  </div>
  <div class="stit">제11조 (거래지시의 철회)</div>
  <div class="item">
    <ul>
      <li>① 이용자는 전자지급거래에 관한 거래지시의 경우 지급의 효력이 발생하기 전까지 거래지시를 철회할 수 있습니다.</li>
      <li>② 전항의 지급의 효력 발생 시점은 다음 각 호의 사유를 말합니다.</li>
      <li class="sitem">1. 전자자금이체의 경우에는 거래 지시된 금액의 정보에 대하여 수취인의 계좌가 개설되어 있는 금융기관의 계좌이체 원장에 입금기록이 끝난 때</li>
      <li class="sitem">2. 그 밖의 전자지급수단으로 지급하는 경우에는 거래 지시된 금액의 정보가 수취인의 계좌가 개설되어 있는 금융기관의 전자적 장치에 입력이 끝난 때</li>
    </ul>
  </div>
  </div>
  <div class="stit">제12조 (전자지급결제대행 서비스 이용 기록의 생성 및 보존)</div>
  <div class="item">
    <ul>
      <li>① 회사는 이용자가 전자금융거래의 내용을 추적, 검색하거나 그 내용에 오류가 발생한 경우에 이를 확인하거나 정정할 수 있는 기록을 생성하여 보존합니다.</li>
      <li>② 전항의 규정에 따라 회사가 보존하여야 하는 기록의 종류 및 보존방법은 제8조 제2항에서 정한 바에 따릅니다.</li>
    </ul>
  </div>
  </div>
  <div class="stit">제13조 (전자금융거래정보의 제공금지)</div>
  <div class="item">
    <ul>
      <li>회사는 전자금융거래 서비스를 제공함에 있어서 취득한 이용자의 인적사항, 이용자의 계좌, 접근매체 및 전자금융거래의 내용과 실적에 관한 정보 또는 자료를 이용자의 동의를 얻지 아니하고 제3자에게 제공·누설하거나 업무상 목적 외에 사용하지 아니합니다. 다만, 「금융실명거래 및 비밀보장에 관한 법률」 제4조제1항 단서의 규정에 따른 경우 및 그 밖에 다른 법률에서 정하는 바에 따른 경우에는 그러하지 아니하다.</li>
    </ul>
  </div>
  </div>
  <div class="stit">제14조 (분쟁처리 및 분쟁조정)</div>
  <div class="item">
    <ul>
      <li>① 이용자는 다음의 분쟁처리 책임자 및 담당자에 대하여 전자금융거래 서비스 이용과 관련한 의견 및 불만의 제기, 손해배상의 청구 등의 분쟁처리를 요구할 수 있습니다.</li>
      <li class="sitem">담당자: 가맹점만족팀</li>
      <li class="sitem">연락처:  1661-5270</li>
      <li class="sitem">E-mail: support@yogiyo.co.kr</li>
      <li>② 이용자가 회사에 대하여 분쟁처리를 신청한 경우에는 회사는 15일 이내에 이에 대한 조사 또는 처리 결과를 이용자에게 안내합니다.</li>
      <li>③ 이용자는 '금융위원회의 설치 등에 관한 법률' 제51조의 규정에 따른 금융감독원의 금융분쟁조정위원회나 '소비자기본법' 제60조 제1항의 규정에 따른 한국소비자원의 소비자분쟁조정위원회에 회사의 전자금융거래 서비스의 이용과 관련한 분쟁조정을 신청할 수 있습니다.</li>
    </ul>
  </div>
  </div>
  <div class="stit">제15조 (회사의 안정성 확보 의무)</div>
  <div class="item">
    <ul>
      <li>회사는 전자금융거래의 안전성과 신뢰성을 확보할 수 있도록 전자금융거래의 종류별로 전자적 전송이나 처리를 위한 인력, 시설, 전자적 장치 등의 정보기술부문 및 전자금융업무에 관하여 금융위원회가 정하는 기준을 준수합니다.</li>
    </ul>
  </div>
  </div>
  <div class="stit">제16조 (약관 외 준칙 및 관할)</div>
  <div class="item">
    <ul>
      <li>① 이 약관에서 정하지 아니한 사항에 대하여는 전자금융거래법, 전자상거래 등에서의 소비자 보호에 관한 법률, 여신전문금융업법 등 관련 법령에서 정한 바에 따릅니다.</li>
      <li>② 회사와 이용자간에 발생한 분쟁에 관한 관할은 민사소송법에서 정한 바에 따릅니다.</li>
    </ul>
  </div>
  </div>
  <div class="stit">부칙</div>
  <div class="item">
    <ul>
      <li>시행일자 : 2021년 11월 1일</li>
    </ul>
  </div>
</body>
</html>
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('서비스 약관'),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: 'https://www.yogiyo.co.kr/mobile/#/policy/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
          _controller.complete(webViewController);
        },
        javascriptChannels: <JavascriptChannel>{},
        onPageStarted: (String url) {
          print('Page started loading: $url');
        },
        onPageFinished: (String url) {
          print('Page finished loading: $url');
        //  _webViewController?.runJavascript(
        //      "document.querySelector('[yogiyo-header]').style.display = 'none'");
        },
        gestureNavigationEnabled: true,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        final String contentBase64 =
        base64Encode(const Utf8Encoder().convert(htmlTerms));
        await _webViewController
            ?.loadUrl('data:text/html;base64,$contentBase64');
      }),
    );
  }
}