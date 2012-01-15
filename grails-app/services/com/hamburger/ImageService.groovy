package com.hamburger

import java.awt.image.BufferedImage
import javax.imageio.ImageIO

import java.awt.Graphics2D
import java.awt.geom.AffineTransform
import java.io.ByteArrayInputStream

/**
 * Service that provides some simple image manipulation to support the
 * image controller. The code has been factored out of ImageController,
 * but this service is not in the book.
 */
class ImageService {

    // image scaling stuff from http://www.velocityreviews.com/forums/t148931-how-to-resize-a-jpg-image-file.html
    byte[] scale(byte[] srcFile, int destWidth, int destHeight) throws IOException {
        BufferedImage src = ImageIO.read(new ByteArrayInputStream(srcFile));
        BufferedImage dest = new BufferedImage(destWidth, destHeight,
                BufferedImage.TYPE_INT_RGB);
        Graphics2D g = dest.createGraphics();
        AffineTransform at = AffineTransform.getScaleInstance(
                (double) destWidth / src.getWidth(),
                (double) destHeight / src.getHeight());
        g.drawRenderedImage(src, at);
        ByteArrayOutputStream baos = new ByteArrayOutputStream()
        ImageIO.write(dest, "JPG", baos);
        return baos.toByteArray()
    }


    byte[] getUserThumbnail(String passportNo) {
        def user = Citizen.findByPassportNo(passportNo)
        def image = user.portrait
        if (!image) {
            log.debug "No profile pic found, using default image"
            def url = this.class.getResource("/default_user.jpg")
            image = new File(url.toURI()).readBytes()
        }
        return image

    }

    byte[] getUserTinyThumbnail(String passportNo) {
        def image = getUserThumbnail(passportNo)
        image = scale(image, 24, 24)
        return image
    }
}

