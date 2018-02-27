/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function loadCards() {
    $.getJSON(url, function (data) {

        $.each(data, function (i, promotions) {


            var content = '<div class="col-xs-12 col-sm-4">\n' +
                    '            <div class="card">\n' +
                    '                <a class="img-card" href="http://www.fostrap.com/">\n' +
                    '                    <img src="https://png.pngtree.com/thumb_back/fw800/back_pic/05/14/55/8259a74b3207b2b.jpg"/>\n' +
                    '                </a>\n' +
                    '                <br />\n' +
                    '                <div class="card-content">\n' +
                    '                    <h4 class="card-title">\n' +
                    '                        <a href="http://www.fostrap.com/">\n' + promotions.promotionDescription +
                    '                        </a>\n' +
                    '                    </h4>\n' +
                    '                    <div class="">\n' +
                    '                        New Delhi, 2005, Petrol\n' +
                    '                    </div>\n' +
                    '                </div>\n' +
                    '                <div class="card-read-more">\n' +
                    '                    <a class="btn btn-link btn-block" href="http://www.fostrap.com/">\n' +
                    '                        Details\n' +
                    '                    </a>\n' +
                    '                </div>\n' +
                    '            </div>\n' +
                    '        </div>';
            $("#promotions").append(content);
        });
    });
}