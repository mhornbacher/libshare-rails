// the comment object that contains its data and can be used for rendering
function Comment(review){
    this.rating = review.rating;
    this.comment = review.comment;
    this.user_name = review.user_name;
    this.updated_at = review.updated_at;
}

Comment.prototype.renderLi = function(){
    var res = "<li class='review-li'><p><strong>";
    res += this.rating + " <span class='glyphicon glyphicon-star'></span> - ";
    res += this.user_name + "</strong> at ";
    if (this.has_comment()){
        res += this.updated_at + "</p>";
        res += "<ul><li>" + this.comment + "</li></ul>";
    }
    res += "</li>"
    return res
}

Comment.prototype.has_comment = function(){
    return this.comment.length > 0;
}

function setUpForm(){
    $("#new_review").submit(function(event) {
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
            
            if (comment.has_comment()){
                $("#comments_list").append(comment.renderLi());
            }
        });
    });
}

function setUpLink(){
    $("#show_all")
}

$(document).ready( function(){
    setUpForm();
    setUpLink();
});