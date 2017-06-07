%iterates over all of the sonorines
%downsamples from the 1st downsampled image and continues until it creates
%the 7th downsampled image
%downsamples all 4 images of the different angles of the sonorines
%downsampled image is 1/4 the size of the original image
%saves the downsampled image into a new directory under processed data and 
%in the Down%d folder where %d is the downsample level

source_path = './Processed/Blue_images_cropped/Sonorine_%03d/sonorine_%03d_%03d.tiff';
dest_path = './Processed/Cropped_downsampled/Down%d/Sonorine_%03d/sonorine_%03d_%03d.tiff';

for i = 1:1 % iterates over all sonorines
    for down = 0:7 % iterates over all downsampling levels
        step = 2;
        
        if down == 0 % first down sampling, files from souce path 
            for rot = 0:3
                img = imread(sprintf(source_path, i, i, rot*90));
                % gets dimensions of future downsampled image
                s = size(img);
                w_raw = s(1);
                h_raw = s(2);
                w = fix(w_raw/step);
                h = fix(h_raw/step);
                m1 = single(max(max(img)));
                img_down = zeros(w,h);
                % generates downsampled image
                for j = 1:w
                    for k = 1:h
                        h_block = j*2;
                        v_block = k*2;

                        pt1 = single(img(h_block-1,v_block-1));
                        pt2 = single(img(h_block-1,v_block));
                        pt3 = single(img(h_block,v_block-1));
                        pt4 = single(img(h_block,v_block));

                        img_down(j, k) = pt1/4/m1+pt2/4/m1+pt3/4/m1+pt4/4/m1;
                    end
                end
                imwrite(img_down, sprintf(dest_path, 1, i, i, rot*90));
    
            end  
        else % for all of the other downsamplings, files from dest path
            for rot = 0:3
                img = imread(sprintf(dest_path, down, i, i, rot*90));
                % gets dimensions of future downsampled image
                s = size(img);
                w_raw = s(1);
                h_raw = s(2);
                w = fix(w_raw/step);
                h = fix(h_raw/step);
                m1 = single(max(max(img)));
                img_down = zeros(w,h);
                % generates downsampled image
                for j = 1:w
                    for k = 1:h
                        h_block = j*2;
                        v_block = k*2;

                        pt1 = single(img(h_block-1,v_block-1));
                        pt2 = single(img(h_block-1,v_block));
                        pt3 = single(img(h_block,v_block-1));
                        pt4 = single(img(h_block,v_block));

                        img_down(j, k) = pt1/4/m1+pt2/4/m1+pt3/4/m1+pt4/4/m1;
                    end
                end
                % creates new image files
                imwrite(img_down, sprintf(dest_path, down+1, i, i, rot*90));

            end
        end
    end
end             
                    