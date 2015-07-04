% Convert standard-format (e.g., 24-bit true color) image file to a
% list (in row-major order) of E100 pixel colors (5 bits for red,
% 5 bits for green, 5 bits for blue).
%
% Written by John Dydo and Peter Chen.

function color100(filename)
    disp('==== E100 Color Image Converter ====');
    
    image_rgb = imread(filename);

    height = size(image_rgb,1);
    width = size(image_rgb,2);
    info = imfinfo(filename);
    % disp(info);

    if (info.BitDepth ~= 24 || ~strcmp(info.ColorType, 'truecolor') || size(image_rgb,3) ~= 3)
        disp(['ERROR: image format must be 24-bit true color']);
        return
    end

    disp(['Input: ' filename ' width=' int2str(width) ' height=' int2str(height)]);

    % Define E100 colormap.
    % The colormap is set up so that the index number (in range 0:32767) of
    % each colormap entry equals the E100 RGB color value for entry's RGB
    % intensities.
    %
    % E100 supports 5 bits for red, 5 bits for green, and 5 bits for blue.
    % Each 5-bit value is mapped to an intensity value between 0-1.

    for red = 0 : 31
        for green = 0 : 31
            for blue = 0 : 31
                % The "+1" adjustment is needed because the colormap matrix
                % has indices [1:32768] (rather than [0:32767])
                entry = bitshift(red,10) + bitshift(green,5) + blue + 1;
                colormap(entry, :) = [red/31 green/31 blue/31];
            end
        end
    end

    % rgb2ind maps each pixel in the image to the index number of the
    % closest color in the colormap.  Since the index for each colormap
    % entry equals the E100 RGB value for that entry, the resulting matrix
    % has the E100 color values for the image.  rgb2ind maps the image to
    % colormap indices [0:32767] instead of [1:32768] (otherwise I'd have to
    % subtract 1 from the index values).
    % Change 'nodither' to 'dither' if you want Matlab to dither the image.

    image_e100 = rgb2ind(image_rgb, colormap, 'nodither');

    imshow(image_e100, colormap);

    % Output the E100 color values for the image to a binary data file
    % (suitable for the SD card) and to a .e file.  It outputs pixels in
    % the following order: start at the upper left, sweep across a row,
    % then go to the next row, eventually reaching the lower right corner
    % of the image.

    disp(['Writing binary and assembly files for this image.  This may take a few minutes...']);

    binfile = [filename  '.bin' ];
    binfid = fopen(binfile, 'w', 'l');    % 'l' specifies little endian byte order

    efile = [filename  '.e' ];
    efid = fopen(efile, 'w');

    for y = 1 : height
        for x = 1 : width
            fwrite(binfid, image_e100(y,x) , 'uint32');
            fprintf(efid, '\t.data %d\n', image_e100(y,x));
        end
    end

    fclose(binfid);
    fclose(efid);

    disp(['Output: ' binfile ' and ' efile]);
end
