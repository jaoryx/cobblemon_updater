   M S B A M L   `   `   `  ���� P  LCobblemon.Updater.WPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null=#clr-namespace:Cobblemon.Updater.WPFCobblemon.Updater.WPF  &     Cobblemon.Updater.WPF.MainWindow   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5local#clr-namespace:Cobblemon.Updater.WPF     -     � Title$  Cobblemon Updater��$	��334��$	��426�� � WindowStartupLocation$ CenterScreen=� � 
ResizeMode$ NoResize=� � 	Resources    FocusVisual �� Property �� Value �� StrokeDashArray!  System.Windows.SystemColors   ControlTextBrushKey J� SnapsToDevicePixels  Button.Static.Background	 �� Color  Button.Static.Border  Button.MouseOver.Background  Button.MouseOver.Border  Button.Pressed.Background  Button.Pressed.Border  Button.Disabled.Background  Button.Disabled.Border 	 Button.Disabled.Foreground 
 RoundedButton
 �� 
TargetType �� 
TargetType ��Name �� CornerRadius ��Name �� Triggers P� Property P� Value �� 
TargetName   HighlightBrushKey��%�  &	        &	 R     &	 g     &	 |     &	 �     &	 �     &	 �     &	 �     &	 �     &		 �     &	
     7   7  7  7  7  7  7  7  7  7 	 �� .���  � �� �� .R��� $��2q�$	 1 2R�#���  $
 true��$��1���� $	 	#FFDDDDDD���� $	 	#FF707070���� $	 	#FFBEE6FD���� $	 	#FF3C7FB1���� $	 	#FFC4E5F6���� $	 	#FF2C628B���� $	 	#FFF4F4F4���� $	 	#FFADB2B5���� $	 	#FF838383���� "
 ��.���  �@�FocusVisualStyle8   ��  � ��8  ��  � ��8  ��  � ��# �  ��  � ��$ 1q���  � ��$ Center=���  � ��$ Center=���  � ��$ 1q���  � �� �� " ��.R��� $ border��$ 10��#��z��#��z��#��z��$
 true��._��� $ contentPresenter��$|�False��#��z��#��z��$
��True��# z #��z�� P�  �@��IsDefaulted$
 true��. ��� $ border��# �   � ��P�  �@J�IsMouseOver$
 true��. ��� $ border��8   � ���� $ border��8   � ��P�  � ��$
 true��. ��� $ border��8   � ���� $ border��8   � ��P�  � {�$ false��. ��� $ border��8   � ���� $ border��8   � ���� $ contentPresenter��8 	  � ��.��� ���	#FF282E3C.+��� -    ��Name$ btnInstallModpack��#��� 
 $��Install Modpack��$
��Left=�$��	21,22,0,0q�$	��Top=�$��32��$	��111�����	#FF1E2430���	#FFCDCFD2���	#FFCDCFD2 J� RenderTransformOrigin$	 1,1&��� -   $ btnInstallMods��#��� 
 $��Update Modpack��$
��Left=�$��
151,22,0,0q�$	��Top=�$��32��$	��111�����	#FF1E2430���	#FFCDCFD2���	#FFCDCFD2$	 1,1&��� -   $ btnDeleteModpack��#��� 
 $��Delete Modpack��$
��Left=�$��
280,22,0,0q�$	��Top=�$��32��$	��111�����	#FF1E2430���	#FFCDCFD2���	#FFCDCFD2$	 1,1&��� -    ��Name$ 	lblMadeBy��$��Made by: Jaoryx��$��309,267,0,0q����	#FFCDCFD2$
��Left=�$	��100��$��26��$	��Top=��� -    ��Name$ txtFeedback��${�False�� �� TextWrapping$
 Wrap=�$�� ��$��22,73,17,49q����	#FFCDCFD2���	#FFCDCFD2��Z� 