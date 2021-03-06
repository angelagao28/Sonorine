function Z = gui_all(path)
    im = im2double(imread(path));
    imshow(im);
    s = size(im);

    % get cx
    title('Draw Box Around Left Hole');
    r = getrect;
    x1 = r(1) + r(3)/2;
    title('Draw Box Around Right Hole');
    r = getrect;
    x2 = r(1) + r(3)/2;
    cx = round((x1 + x2)/2);

    % get r1
    title('Draw Box Around Edges of the Large Diameter on the Line');
    hold on
    x =[cx - 10 cx + 10];
    y =[0 s(1)];
    line(x,y)
    r = getrect;
    r1 = round(r(4)/2);
    y1 = r(2) + r(4)/2;

    % get r2
    title('Draw Box Around Edges of the Small Diameter on the Line'); 
    r = getrect;
    y2 = r(2) + r(4)/2;
    r2 = round(r(4)/2);

    cy = round((y1 + y2)/2);   

    Z = get_overlay_all(cx, cy, r1, r2, s);
end
