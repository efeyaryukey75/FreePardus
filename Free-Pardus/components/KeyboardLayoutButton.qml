/*
 *   Copyright 2020 efeyaryukey <muhammedfaruk@protonmail.com
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU Library General Public License as
 *   published by the Free Software Foundation; either version 3 or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details
 *
 *   You should have received a copy of the GNU Library General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 2.1
import QtQuick.Controls 1.1 as QQC

import org.kde.plasma.components 2.0 as PlasmaComponents

import org.kde.plasma.workspace.keyboardlayout 1.0

PlasmaComponents.ToolButton {
    id: kbLayoutButton

    iconName: "input-keyboard"
    implicitWidth: minimumWidth
    text: layout.currentLayoutDisplayName

    Accessible.name: i18ndc("plasma_lookandfeel_org.kde.lookandfeel", "Button to change keyboard layout", "Switch layout")

    visible: layout.layouts.length > 1

    onClicked: layout.nextLayout()

    KeyboardLayout {
          id: layout
              function nextLayout() {
              var layouts = layout.layouts;
              var index = (layouts.indexOf(layout.currentLayout)+1) % layouts.length;
              layout.currentLayout = layouts[index];
          }
    }
}
