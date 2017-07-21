
function LineItem(review){
    this.name = review.name
    this.average_rating = review.average_rating;
    this.description = review.description;
    this.path = review.path;
}

LineItem.prototype.render = function() {
    res  = '<div class="col-md-4 col-full-height">';
    res += '<h3><a href = "' + this.path + '">'+ this.name +'</a> | ' + this.average_rating + ' <span class="glyphicon glyphicon-star"></span></h3>';
    res += '<p>' + this.description + '</p>';
    res += '</div>';
    return res
}


function setUpPage(){
    $('#load_libs').click(function(event){
        event.preventDefault();
        var url = location.protocol + '//' + location.host + location.pathname + "/libraries.json";
        console.log(url)
        $.get(url, function(data){
            var finalString = ""
            data.forEach(function(item){
                item = new LineItem(item);
                finalString += item.render();
            });
            $('#libs').html(finalString)
        });
    })
}

$(document).ready(function() {
    setUpPage();
});