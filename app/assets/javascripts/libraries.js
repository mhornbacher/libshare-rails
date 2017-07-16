// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function renderButtons(buttons){
    var box = $("#edit_buttons")
    box.html("")
    if (buttons.edit){
        box.append('<a class="btn btn-primary edit-btn" href="' + buttons.edit_path + '"> Edit </a>')
    }
    if (buttons.delete) {
        box.append('<a class="btn btn-danger destroy-btn" data-method="delete" rel="nofollow" href="' + buttons.delete_path + '"> Delete </a>')
    }
}

function renderReviews(reviews){
    $("#comments_list").html("");
    reviews.forEach(function(review){
        var comment = new Comment(review);
        
        if (comment.has_comment() || show_all){
            $("#comments_list").append(comment.renderLi());
        }
    });
}

function getNext(event){
    if(event){event.preventDefault();}
    $.get($(this).attr("href") + ".json").done(function(data){
        if(data.error){alert(data.error);return data;}
        // there is no error...
        var library = data.library
        // set all the library info to be updated
        $("#lib-name").text(library.name);
        $("#rating").text(library.rating);
        if (library.version != null){$("#version").text(library.version)};
        $("#vote_count").text(library.vote_count);
        $("#comment_count").text(library.comment_count);
        $("#description").html(library.description);

        // now for the links
        $("#next_link").attr("href", data.links.next);
        $("#language_link").attr("href", data.links.language);
        $("#language_link").text(data.links.language_text);
        $("#framework_link").attr("href", data.links.framework);
        $("#framework_link").text(data.links.framework_text);

        renderButtons(data.buttons);

        renderReviews(library.reviews);
        $("#show_all").attr("href", data.links.reviews);
    }).fail( function(data) {
        console.error(data);
    });
}

$(document).ready(function(){
    $("#next_link").on('click', getNext);
})