var element = document.getElementById("article-<%= @article.id %>");
element.remove();
$('#flash').append('<%= bootstrap_flash %>');
