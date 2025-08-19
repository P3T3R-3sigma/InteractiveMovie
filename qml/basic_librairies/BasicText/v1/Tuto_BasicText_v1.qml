import QtQuick
import Felgo
import "../../../abstract"
import "../../Utils/v1"
import "../../BasicReflection/v3"
import "../../BasicGlobalFollower/v2"
import "../../BasicImageSource/v1"

SceneAbstract {

    id: mThisSampleScene

    /////////////////////////////////////////////////////////////
    //      OTHER LIBRAIRIES NEEDED
    /////////////////////////////////////////////////////////////
    BasicDisplay {
        id: mBasicDisplay
    }
    BasicNum {
        id: mBasicNum
    }
    BasicConst {
        id: mBasicConst
    }
    BasicReflection {
        id: mBasicReflection
    }
    BasicGlobalFollower {
        id: mBasicGlobalFollower
    }


    ///////////////////////////////////////////////////////////
    ////        TUTO
    ///////////////////////////////////////////////////////////

    onWStartChanged: {
        p1.startBumpFullWindow();
        p2.startBumpFullWindow();
        p3.startBumpFullWindow();
        p4.startBumpFullWindow();
        q1.startBumpFullWindow();
        q2.startBumpFullWindow();
        q3.startBumpFullWindow();
        q4.startBumpFullWindow();
    }

    property real mPaddingHeight: 0.05

    BasicTextFitToWindow {
        id: p0
        text: "BasicTextFitToWindow"
        xPercent: 0.05
        yPercent: mPaddingHeight
        widthPercent: 0.25
        heightPercent: 0.125
        textColor: "white"
        backgroundColor: "orange"

        backgroundOpacity: 0.5
        textIsAlignToCenter: true
        paddingPercentWidth: 0.1
        paddingPercentHeight: 0.1

        borderColor: "white"
        borderWidthPercent: 0.03
    }

    BasicTextFitToWindow {
        id: p1
        text: "Higher letter and word spacing\nHigher line spacing\ntext centered"
        xPercent: 0.05
        yPercent: mPaddingHeight + p0.yPercent + p0.heightPercent
        widthPercent: 0.25
        heightPercent: 0.125
        textColor: "cyan"
        backgroundColor: "orange"
        backgroundOpacity: 0.5
        textLetterSpacingPixelsPercent: 0.001
        textWordSpacingPixelsPercent: textLetterSpacingPixelsPercent * 5
        textLineHeightPercent: 2
        textIsAlignToCenter: true
    }

    BasicTextFitToWindow {
        id: p2
        text: {"text aligned to the left"
        + "\nto the top"
        + "\nwith 4 lines"
        + "\nto occupy height";
        }
        xPercent: 0.05
        yPercent: mPaddingHeight + p1.yPercent + p1.heightPercent
        widthPercent: 0.25
        heightPercent: 0.125
        textColor: "white"
        backgroundColor: "orange"
        backgroundOpacity: 0.5
    }

    BasicTextFitToWindow {
        id: p3
        text: {"text aligned to the right"
        + "\nto the top"
        + "\nwith 4 lines"
        + "\nto occupy height";
        }
        xPercent: 0.05
        yPercent: mPaddingHeight + p2.yPercent + p2.heightPercent
        widthPercent: 0.25
        heightPercent: 0.125
        textColor: "white"
        backgroundColor: "orange"
        backgroundOpacity: 0.5
        textIsAlignToRight: true
    }

    BasicTextFitToWindow {
        id: p4
        text: "textFontPixelSizePercent= " + textFontPixelSizePercent
+ "\nà préserver les générations futures du fléau de la guerre qui deux fois en l'espace d'une vie humaine a infligé à l'humanité d'indicibles souffrances,"
+ "\nà proclamer à nouveau notre foi dans les droits fondamentaux de l'homme, dans la dignité et la valeur de la personne humaine, dans l'égalité de droits des hommes et des femmes, ainsi que des nations, grandes et petites,"
+ "\nà créer les conditions nécessaires au maintien de la justice et du respect des obligations nées des traités et autres sources du droit international,"
+ "\nà favoriser le progrès social et instaurer de meilleures conditions de vie dans une liberté plus grande,"
              // + "\n"
+ "\net a ces fins"
+ "\nà pratiquer la tolérance, à vivre en paix l'un avec l'autre dans un esprit de bon voisinage,"
+ "\nà unir nos forces pour maintenir la paix et la sécurité internationales,"
+ "\nà accepter des principes et instituer des méthodes garantissant qu'il ne sera pas fait usage de la force des armes, sauf dans l'intérêt commun,"
+ "\nà recourir aux institutions internationales pour favoriser le progrès économique et social de tous les peuples,"

        xPercent: 0.05
        yPercent: mPaddingHeight + p3.yPercent + p3.heightPercent
        widthPercent: 0.25
        heightPercent: 0.125
        textColor: "white"
        backgroundColor: "orange"
        backgroundOpacity: 0.5
        textIsWrapped: true
        textIsAlignJustify: true
    }


    /*


      BasicTextFitToText


      */

    property real mPixelSize: 0.02

    BasicTextFitToText {
        xPercent: 0.35
        yPercent: mPaddingHeight
        text: "BasicTextFitToText"
        textFontPixelSizePercent: mPixelSize
        backgroundColor: "pink"
        textColor: "blue"
        borderWidthPercent: 0.01
        borderColor: "white"
    }

    BasicTextFitToText {
        id: q1
        xPercent: 0.35
        yPercent: p1.yPercent
        text: "Higher letter and word spacing\nHigher line spacing\ntext centered"
        textFontPixelSizePercent: mPixelSize
        backgroundColor: "pink"
        textColor: "blue"
        backgroundOpacity: 0.5
        textLetterSpacingPixelsPercent: 0.01
        textWordSpacingPixelsPercent: textLetterSpacingPixelsPercent * 5
        textLineHeightPercent: 2
        textIsAlignToCenter: true
    }

    BasicTextFitToText {
        id: q2
        xPercent: 0.35
        yPercent: p2.yPercent
        text: {"text aligned to the left"
        + "\nto the top"
        + "\nwith 4 lines"
        + "\nto occupy height";
        }
        textFontPixelSizePercent: mPixelSize
        backgroundColor: "pink"
        textColor: "blue"
    }

    BasicTextFitToText {
        id: q3
        xPercent: 0.35
        yPercent: p3.yPercent
        text: {"text aligned to the right"
        + "\nto the top"
        + "\nwith 4 lines"
        + "\nto occupy height";
        }
        textFontPixelSizePercent: mPixelSize
        backgroundColor: "pink"
        textColor: "blue"
        textIsAlignToRight: true
    }

    BasicTextFitToText {
        id: q4
        xPercent: 0.35
        yPercent: p4.yPercent
        text: "    -   BasicTextFitToText      -  WRAP MODE= " + textIsWrapped
+ "\nà préserver les générations futures du fléau de la guerre qui deux fois en l'espace d'une vie humaine a infligé à l'humanité d'indicibles souffrances,"
+ "\nà proclamer à nouveau notre foi dans les droits fondamentaux de l'homme, dans la dignité et la valeur de la personne humaine, dans l'égalité de droits des hommes et des femmes, ainsi que des nations, grandes et petites,"
+ "\nà créer les conditions nécessaires au maintien de la justice et du respect des obligations nées des traités et autres sources du droit international,"
+ "\nà favoriser le progrès social et instaurer de meilleures conditions de vie dans une liberté plus grande,"
              // + "\n"
+ "\net a ces fins"
+ "\nà pratiquer la tolérance, à vivre en paix l'un avec l'autre dans un esprit de bon voisinage,"
+ "\nà unir nos forces pour maintenir la paix et la sécurité internationales,"
+ "\nà accepter des principes et instituer des méthodes garantissant qu'il ne sera pas fait usage de la force des armes, sauf dans l'intérêt commun,"
+ "\nà recourir aux institutions internationales pour favoriser le progrès économique et social de tous les peuples,"
        textFontPixelSizePercent: mPixelSize
        backgroundColor: "pink"
        textColor: "blue"

    }




    BasicTextFitHeightToText {
        id: r1

        text: "BasicTextFitHeightToText\n\nFIXED widthPercent=" + widthPercent + "\n\nFontPixelSizePercent= " + textFontPixelSizePercent + "; wrapMode= " + textIsWrapped + "; padding=0"
        xPercent: 0.5 // q2.xPercent + Math.max(q2.widthPercent, q3.widthPercent) * 1.3
        yPercent: 0.4 // p2.yPercent
        widthPercent: 0.4
        backgroundColor: "cyan"
        textColor: "black"
        textFontPixelSizePercent: mPixelSize
        paddingPercentHeight: 0
        paddingPercentWidth: 0
        textIsWrapped: true
    }

    BasicTextFitWidthToText {
        id: r2

        text: "BasicTextFitWidthToText\n\nFIXED heightPercent= " + heightPercent + "\n\nFontPixelSize= " + textFontPixelSizePercent + "; Text align to the top; wrapMode= " + textIsWrapped
        xPercent: 0.53 //r1.xPercent
        yPercent: 0.53 // r1.yPercent + r1.heightPercent * 1.2
        heightPercent: 0.2
        backgroundColor: "cyan"
        textColor: "black"
        textIsAlignToTop: true
        textFontPixelSizePercent: mPixelSize
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            r2.text = "Je m'adapte a la nouvelle taille"
        }
    }

}
