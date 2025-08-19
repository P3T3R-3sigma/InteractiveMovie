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
        p0.startBumpText();
        p1.startBumpFullWindow();
        p2.startBumpFullWindow();
        p3.startBumpFullWindow();
        p4.startBumpFullWindow();
        q1.startBumpFullWindow();
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

        backgroundOpacity: 1
        textIsAlignToCenter: true
        paddingPercentWidth: 0.05
        paddingPercentHeight: 0.05

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


    BasicTextFitToWindow {
        id: q1
        text: "BasicTextFitToWindow"
        + "\n" + "textColor: 'black'; backgroundColor: 'grey'"
        + "\n" + "borderColor: 'white'; borderWidthPercent: " + borderWidthPercent
        + "\n" + "textLineHeightPercent: " + textLineHeightPercent
        + "\n" + "textIsAlignToCenter: " + textIsAlignToCenter
        + "\n" + "paddingPercentHeight: " + paddingPercentHeight + "; paddingPercentWidth: " + paddingPercentWidth

        xPercent: 0.35
        yPercent: p0.yPercent
        widthPercent: 0.50
        heightPercent: 0.125 * 3

        textColor: "black"
        backgroundColor: "grey"
        borderColor: "white"
        borderWidthPercent: 0.01

        textLineHeightPercent: 1.5
        textIsAlignToCenter: true
        paddingPercentHeight: 0.10
        paddingPercentWidth: 0.10
    }


}
