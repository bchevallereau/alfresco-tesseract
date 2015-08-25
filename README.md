# Alfresco OCR / Tessearct module

The goal of this module is to be able to index images in Alfresco, and to use the full text search to find your images. The current module supports: PNG, BMP, JPEG, GIF, TIFF and PDF (containing images).

## Installation

First, you need package the AMP file:

```
mvn clean package
```

Then, install the AMP file in your alfresco.war file using Alfresco MMT. Finally, deploy the script "ocr.sh" in your Alfresco server. You can download it here: https://github.com/bchevallereau/alfresco-tesseract/blob/master/src/test/resources/ocr.sh
The script should be located by default in: /opt/alfresco/ocr.sh. If it's not located here, you can change the path by adding the following line in your alfresco-global.properties:

```
ocr.script=...
```

## Supported platform

This module has been tested only on Alfresco 4.2.f Community on Ubunutu 14.04 (with Tesseract 3).
