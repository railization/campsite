$(document).ready(function() {


    $('input[type=radio][name="property[percent_down_payment]"]').change(function() {
        if (this.value == 'other') {

            $("#property_down_payment").prop("disabled", false);
            $("#loan_amount").val( $("#purchase_price").val());
            $("#property_down_payment").val('');
            $("#property_amount").val('');
        }
        else  {
            $("#property_down_payment").prop("disabled", true);
            $("#property_down_payment").val($('input[type=radio][name="property[percent_down_payment]"]:checked').val()+"%");
            calculate_and_set_loan( this.value , $("#purchase_price").val() );
            calculate_motgage($("#month_value").val(), $("#interest_rate").val(),$("#loan_amount").val() );

        }
    });
    $("#property_down_payment").on("change paste keyup", function() {

        calculate_and_loan( this.value.replace('%', '') , $("#purchase_price").val() );
        calculate_motgage($("#month_value").val(), $("#interest_rate").val(),$("#loan_amount").val() );
    });

    $("#purchase_price").on("change paste keyup", function() {

    if ($('input[type=radio][name="property[percent_down_payment]"]:checked').val() == "other")
       {
           calculate_and_set_loan( $("#property_down_payment").val(),  $("#purchase_price").val() );
       }

    else
    {
        calculate_and_set_loan($('input[type=radio][name="property[percent_down_payment]"]:checked').val() , $("#purchase_price").val() );
    }


        calculate_motgage($("#month_value").val(), $("#interest_rate").val(),$("#loan_amount").val() );

    });

    function calculate_and_set_loan(down_payment , purchase_price )
    {
        var down_payment_percent =    down_payment
        var purchase_price =   purchase_price
        var calculate_percentage =  (down_payment_percent/100)*purchase_price
        $("#loan_amount").val(purchase_price-calculate_percentage)
        $("#property_down_payment").val(calculate_percentage);

        $("#second_property").val(calculate_percentage);

    }

    function calculate_and_loan(down_payment , purchase_price )
    {
        var down_payment_percent =    down_payment
        var purchase_price =   purchase_price
        //var calculate_percentage =  (down_payment_percent/100)*purchase_price
        $("#loan_amount").val(purchase_price-down_payment)


    }

    $('#month_value').on('change', function() {

        calculate_motgage(this.value , $("#interest_rate").val() , $("#loan_amount").val()  );


    });


    $("#interest_rate").on("change paste keyup", function() {


        calculate_motgage($("#month_value").val(),this.value ,  $("#loan_amount").val() );
    });


    $("#tax_amount").on("change paste keyup", function() {

        calculate_motgage($("#month_value").val(), $("#interest_rate").val(),$("#loan_amount").val() );

    });


    $("#insurance_amount").on("change paste keyup", function() {

        calculate_motgage($("#month_value").val(), $("#interest_rate").val(),$("#loan_amount").val() );
    });


    function calculate_motgage(month,interesrate ,loan_amount) {

        var tax_amount = 0;
        var insurance_amount = 0;
        var calculate_month = month*12;
        var interest_rate = interesrate/100;
        var loan_amount = loan_amount;
        var i = Math.pow((1+(interest_rate/12)) , (12/12))-1;
        var annunity_part1 = (1/(1+i))
        var  annuity =(1-Math.pow(annunity_part1,calculate_month))/i;
        var  payment = loan_amount/annuity
         tax_amount = $("#tax_amount").val()/12;
         insurance_amount = $("#insurance_amount").val()/12;

        console.log(tax_amount);
        console.log(insurance_amount);

        payment = payment + tax_amount + insurance_amount ;

        console.log(payment);
        $("#property_amount").val(payment.toFixed(2));

    }


});


$(function() {
    $('.image_click').on('click', function() {
        $('.enlargeImageModalSource').attr('src', $(this).attr('src'));
        $('#enlargeImageModal').modal('show');
    });
});