<style>

.ball{
       width:20px;
       height:20px;border-radius:100px; 
       float:left;
}
</style>
<script src="http://code.jquery.com/jquery-1.8.1.js"></script>
<script>
       $(document).ready(function(){
       var ballScoll="";
       var getColorBall = function(position,color){
               if(position==1){
                       ballScoll+="<div id=\"ball1\"  class=\"ball\" style=\"background-color:"+color+"\"></div>";
                       ballScoll+="<div id=\"ball2\"  class=\"ball\" style=\"background-color:#cccccc\"></div>";
                       ballScoll+="<div id=\"ball3\"  class=\"ball\" style=\"background-color:#cccccc\"></div>";

               }else if(position==2){
                       ballScoll+="<div id=\"ball1\"  class=\"ball\" style=\"background-color:#cccccc\"></div>";
                       ballScoll+="<div id=\"ball2\"  class=\"ball\" style=\"background-color:"+color+"\"></div>";
                       ballScoll+="<div id=\"ball3\"  class=\"ball\" style=\"background-color:#cccccc\"></div>";
               }else if(position==3){
                       ballScoll+="<div id=\"ball1\"  class=\"ball\" style=\"background-color:#cccccc\"></div>";
                       ballScoll+="<div id=\"ball2\"  class=\"ball\" style=\"background-color:#cccccc\"></div>";
                       ballScoll+="<div id=\"ball3\"  class=\"ball\" style=\"background-color:"+color+"\"></div>";
               }
       }

       getColorBall(1,"#f1f1f1");
       });
</script>