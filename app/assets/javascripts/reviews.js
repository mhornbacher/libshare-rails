var show_all = false;

// the comment object that contains its data and can be used for rendering
function Comment(review){
    this.rating = review.rating;
    this.comment = review.comment;
    this.user_name = review.user_name;
    this.updated_at = review.updated_at;
}

Comment.prototype.renderLi = function(){
    // create and fill int the template
    var res = "<li class='review-li'><p><strong>";
    res += this.rating + " <span class='glyphicon glyphicon-star'></span> - ";
    res += this.user_name + "</strong> at ";
    res += this.updated_at + "</p>";
    // show the comment if it exists
    if (this.has_comment()){
        res += "<ul><li>" + this.comment + "</li></ul>";
    }
    res += "</li>"
    return res
}

Comment.prototype.has_comment = function(){
    if (this.comment == null){
        return false;
    }
    return this.comment.length > 0;
}

function setUpForm(){
    $("#new_review").on('submit', function(event) {
        event.preventDefault();

        var form = $(this);

        var values = form.serialize();
        var url = form.attr("action");

        $.post(url + ".json", values).done(function(data) {
            $("#vote_count").text(data["vote_count"]);
            $("#comment_count").text(data["comment_count"]);
            $("#average_rating").text(data["average_rating"]);
            // create the comment object
            var comment = new Comment(data["review"]);
            
            if (comment.has_comment() || show_all){
                $("#comments_list").append(comment.renderLi());
            }
        });
    });
}

function setUpLink(){
    $("#show_all").on('click', function(event){
        event.preventDefault();
        url = $(this).attr("href") + ".json"
        $.get(url).done(function(data){
            $("#comments_list").html("");
            data.forEach(function(review){
                var comment = new Comment(review);
                $("#comments_list").append(comment.renderLi());
            })
        });
        show_all = true;
    });
    console.log("link setup")
}

$(document).ready( function(){
    setUpForm();
    setUpLink();
});