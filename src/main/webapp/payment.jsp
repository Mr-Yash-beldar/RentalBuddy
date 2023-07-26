<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String apiKey="rzp_test_RM318IJpdgV1QH";
%>
<form action="" method="post">
<script src="https://checkout.razorpay.com/v1/checkout.js"
data-key="<%=apiKey %>"
data-amount="100"
data-currency="INR"
data-id="yash12"
data-buttontext="Pay Now"
data-name="Yashodip"
data-description="Yashodip Beldar"
data-image="https://avatars.githubusercontent.com/u/106594839?v=4"
data-prefill.name="Gopal Patil"
data-prefill.email="gopalpatil@gmail.com"
data-prefill.color="#F37254"
></script>

</form>
