if wait > 0 wait -= 1 else {
    if image_alpha > 0.8 image_alpha -= 0.05
    if cfade < 0.7 cfade += 0.05
}

//image_blend=merge_color(c_white,c_maroon,cfade)
