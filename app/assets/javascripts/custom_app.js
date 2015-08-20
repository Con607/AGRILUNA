

$(document).ready(function () {

    // Update discounts on pay_roll_item 
    //$('.pay_roll_item_discount_update').click(function() {
    //    var domid = $(this).attr('id');
    //    //var pay_roll_item_id = domid.substr(domid.length - 5);
    //    var pay_roll_item_id = domid.match(/\d+/);
    //    var AUTH_TOKEN = $('meta[name=csrf-token]').attr('content');
    //    $('#'+domid).fadeOut();
    //    $('<form accept-charset="UTF-8" action="/pay_roll_items?pay_roll_item=' + pay_roll_item_id + '" method="post" data-remote="true"><input name="discounts" /><input type="hidden" name="authenticity_token" id="authenticity_token" value="' + AUTH_TOKEN + '"><input name="commit" type="submit" value="Create" /></form>').appendTo(
    //        "#td_"+domid);
    //});

    //$('.discount_update_form_button').click(function(event) {
    //  event.preventDefault();
    //  return alert('Testing...');
    //});

        
//    var update_discount, url, domid, pay_roll_item_id;
//
//    $('.discount_update_form_button').click(function(event) {
//        event.preventDefault();
//        domid = $(this).attr('id');
//        pay_roll_item_id = domid.match(/\d+/);
//        alert('discount... domid='+domid+', pay_roll_item_id='+pay_roll_item_id );
//
//        alert('update form...');
//        url = $(this).attr('action');
//        update_discount = $('div#discount_update_form_' + pay_roll_item_id + ' #pay_roll_item_discounts').val();
//        $.ajax;
//        ({
//          type: 'patch',
//          url: url,
//          data: {
//            pay_roll_item: {
//              discounts: update_discount
//            }
//          },
//          dataType: 'json',
//          success: function(json) {}
//        });
//
//        $('#pay_roll_item_' + pay_roll_item_id).text("json.pay_roll_item").slideDown()//.effect('highlight');
//
//        //if (json.decomp === "Dead (again)") {
//          $('div#discount_update_form_' + pay_roll_item_id).fadeOut();
//    });
//

});
