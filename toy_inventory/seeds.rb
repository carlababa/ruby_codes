require './toys_file'

toys = []

toys << { name: "Small Doll", quantity: 12, img: "https://upload.wikimedia.org/wikipedia/commons/c/c8/Baby_doll-Calineczka-2006.jpg" }
toys << { name: "Big Doll", quantity: 10, img: "https://pixabay.com/static/uploads/photo/2016/01/22/23/14/doll-1156832_960_720.jpg" }
toys << { name: "Red Car", quantity: 15, img: "https://pixabay.com/static/uploads/photo/2015/11/26/17/58/toys-1064259_960_720.jpg" }
toys << { name: "Blue Car", quantity: 8, img: "https://upload.wikimedia.org/wikipedia/commons/2/2b/Corgi_2cv_white_bg.JPG" }
toys << { name: "Fluffy Bear", quantity: 6, img: "https://pixabay.com/static/uploads/photo/2010/12/13/10/01/teddy-2142_960_720.jpg" }

write_toys(toys)
