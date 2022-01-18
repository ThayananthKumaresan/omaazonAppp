<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/10/2022
  Time: 4:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    @import url(https://fonts.googleapis.com/css?family=Lato:400,300,700);
    body,html {
        height:100%;
        margin:0;
        font-family:lato;
    }

    h2 {
        margin-bottom:0px;
        margin-top:25px;
        text-align:center;
        font-weight:200;
        font-size:19px;
        font-size:1.2rem;

    }
    .container {
        height:100%;
        -webkit-box-pack:center;
        -webkit-justify-content:center;
        -ms-flex-pack:center;
        justify-content:center;
        -webkit-box-align:center;
        -webkit-align-items:center;
        -ms-flex-align:center;
        align-items:center;
        display:-webkit-box;
        display:-webkit-flex;
        display:-ms-flexbox;
        display:flex;
        background:-webkit-linear-gradient(#c5e5e5, #ccddf9);
        background:linear-gradient(#c9e5e9,#ccddf9);
    }
    ul {
        margin:0;
        padding:0;
    }
    ul li {
        list-style:none;
        padding-left:10px;
        cursor:pointer;
    }
    ul li:hover {
        background:rgba(255,255,255,0.1);
    }
    .half-input-table td:first-of-type {
        border-right:10px solid #4488dd;
        width:50%;
    }
    .window {
        height:200px;
        width:400px;
        background:#fff;
        display:-webkit-box;
        display:-webkit-flex;
        display:-ms-flexbox;
        display:flex;
        box-shadow: 0px 15px 50px 10px rgba(0, 0, 0, 0.2);
        border-top-right-radius:30px;
        border-top-left-radius:30px;
        border-bottom-left-radius:30px;
        border-bottom-right-radius:30px;
        z-index:10;
    }
    .order-table td:first-of-type {
        width:25%;
    }

    .order-table td:last-of-type {
        vertical-align:top;
        padding-left:25px;
    }

    .pay-btn {
        border:none;
        background:#22b877;
        line-height:2em;
        border-radius:10px;
        font-size:19px;
        font-size:1.2rem;
        color:#fff;
        cursor:pointer;
        position:absolute;
        bottom:25px;
        width:calc(100% - 50px);
        -webkit-transition:all .2s ease;
        transition:all .2s ease;
    }
    .pay-btn:hover {
        background:#22a877;
        color:#eee;
        -webkit-transition:all .2s ease;
        transition:all .2s ease;
    }
    .input-field {
        background:rgba(255,255,255,0.1);
        margin-bottom:10px;
        margin-top:3px;
        line-height:1.5em;
        font-size:20px;
        font-size:1.3rem;
        border:none;
        padding:5px 10px 5px 10px;
        color:#fff;
        box-sizing:border-box;
        width:100%;
        margin-left:auto;
        margin-right:auto;
    }
    .credit-info {
        background:#4488dd;
        height:100%;
        width:100%;
        color:#eee;
        -webkit-box-pack:center;
        -webkit-justify-content:center;
        -ms-flex-pack:center;
        justify-content:center;
        font-size:14px;
        font-size:.9rem;
        display:-webkit-box;
        display:-webkit-flex;
        display:-ms-flexbox;
        display:flex;
        box-sizing:border-box;
        padding-left:25px;
        padding-right:25px;
        border-top-right-radius:30px;
        border-top-left-radius:30px;
        border-bottom-left-radius:30px;
        border-bottom-right-radius:30px;
        position:relative;
    }
    .credit-info-content {
        margin-top:25px;
        -webkit-flex-flow:column;
        -ms-flex-flow:column;
        flex-flow:column;
        display:-webkit-box;
        display:-webkit-flex;
        display:-ms-flexbox;
        display:flex;
        width:100%;
    }
    @media (max-width: 600px) {
        .window {
            width: 100%;
            height: 100%;
            display:block;
            border-radius:0px;
        }

        .credit-info {
            width:100%;
            height:auto;
            padding-bottom:100px;
            border-radius:0px;
        }
        .pay-btn {
            border-radius:0px;
        }
    }

</style>

<form id="payment-form" action="CheckoutServlet" method="post" >

<div class='container'>
    <div class='window'>
        <div class='credit-info'>
            <div class='credit-info-content'>
                Wallet Password
                    <input class='input-field' id="paymentPassword" type="password" name="paymentPassword"></input>
                    <button type="submit" class='pay-btn'>Checkout</button>
            </div>
        </div>
    </div>
</div>
</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>



<script>


    $ (document).ready (function (e) {
        $ ("#payment-form").on ("submit", function (event) {

            <%
            String totalCheckoutAmount = request.getParameter("totalCheckoutAmount");

            %>

            event.preventDefault ();
            var form = {
                paymentPassword: $("#paymentPassword").val(),
                totalCheckoutAmount : <%=totalCheckoutAmount%>
            };

            $. ajax ({
                url: "CheckoutServlet",
                type: 'POST',
                data: form,
                success : function (data ,textStatus,jqXHR){
                    console.log(data);

                    if(data.trim() === "successful") {
                        swal({
                            icon: 'success',
                            title: 'Payment Successful ! You will be now redirected to Order History page !',
                            html: 'Welcome back !',
                            timer: 5000,
                            timerProgressBar: true,
                            didOpen: () => {
                                Swal.showLoading()
                                timerInterval = setInterval(() => {
                                    const content = Swal.getContent()
                                    if (content) {
                                        const b = content.querySelector('b')
                                        if (b) {
                                            b.textContent = Swal.getTimerLeft()
                                        }
                                    }
                                }, 100)
                            }
                        }).then(function() {
                            window.location.replace('Customer_Order_History.jsp');
                        });


                    }else if (data.trim() == "lowBalanceFlag"){
                        swal('Low balance in your wallet! ', 'Please top up before you make your payment !', 'error');
                    }else if (data.trim() == "wrongPasswordFlag"){
                        swal('Wrong password entered ! ', 'Please enter your correct password!', 'error');
                    }


                }
            })
        })
    })

</script>