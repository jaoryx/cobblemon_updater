   M S B A M L   `   `   `  ����P  LCobblemon.Updater.WPF, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null=#clr-namespace:Cobblemon.Updater.WPFCobblemon.Updater.WPF  5   	   &     Cobblemon.Updater.WPF.MainWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   5local#clr-namespace:Cobblemon.Updater.WPF     5   	   -   5          � Title$  Cobblemon Updater��5   	   $	��334��6#   $	��426��60    � WindowStartupLocation$ CenterScreen=�6<    � 
ResizeMode$ NoResize=�6x    � 	Resources 5	         FocusVisual �� Property �� Value �� StrokeDashArray!  System.Windows.SystemColors   ControlTextBrushKey J� SnapsToDevicePixels  Button.Static.Background	 �� Color  Button.Static.Border  Button.MouseOver.Background  Button.MouseOver.Border  Button.Pressed.Background  Button.Pressed.Border  Button.Disabled.Background  Button.Disabled.Border 	 Button.Disabled.Foreground 
 RoundedButton
 �� 
TargetType �� 
TargetType ��Name �� CornerRadius ��Name �� Triggers P� Property P� Value �� 
TargetName   HighlightBrushKey��%�  &	        &	 �     &	 �     &	 �     &	     &	 ?    &	 b    &	 �    &	 �    &		 �    &	
 �    7   7  7  7  7  7  7  7  7  7 	 �� 5
   
   .�5      ��  � �� 5      �� 5      .R�5      �� $��2q�6$   $	 1 2R�6/   #���  6E   $
 true��6�   $��1��6�   5      5      5      �� 5   
   $	 	#FFDDDDDD��6;   �� 5   
   $	 	#FF707070��67   �� 5   
   $	 	#FFBEE6FD��6>   �� 5   
   $	 	#FF3C7FB1��6:   �� 5   
   $	 	#FFC4E5F6��6<   �� 5   
   $	 	#FF2C628B��68   �� 5   
   $	 	#FFF4F4F4��6=   �� 5   
   $	 	#FFADB2B5��69   �� 5   
   $	 	#FF838383��6=   �� 5   
   "
 ��6&   .�5      ��  �@�FocusVisualStyle8   61   �� 5       � ��8  6+   �� 5       � ��8  6,   �� 5        � ��# �  6+   �� 5!       � ��$ 1q�60   �� 5"       � ��$ Center=�6;   �� 5#       � ��$ Center=�69   �� 5$       � ��$ 1q�6(   �� 5%       � �� 5&      �� 5'      " ��6&   .R�5(      �� $ border��6!   $ 10��61   #��z��6C   #��z��6m   #��z��6�   $
 true��6�   ._�5)      �� $ contentPresenter��6/   $|�False��6I   #��z��6[   #��z��6�   $
��True��6�   # z 6�   #��z��6  5*       5+      P� 5,       �@��IsDefaulted$
 true��6=   . �5-   "   �� $ border��6@   # �  6T    � ��5.      P� 5/       �@J�IsMouseOver$
 true��6=   . �50   "   �� $ border��6?   8   � ��6S   �� 51   "   $ border��6@   8   � ��6T   52      P� 53       � ��$
 true��6;   . �54   "   �� $ border��6?   8   � ��6S   �� 55   "   $ border��6@   8   � ��6T   56      P� 57       � {�$ false��6;   . �58   "   �� $ border��6?   8   � ��6S   �� 59   "   $ border��6@   8   � ��6T   �� 5:   "   $ contentPresenter��6K   8 	  � ��6i   5;      5=      5?      5@      5A      .��5B      � ���	#FF282E3C.+�5C   
   �� -   5         ��Name$ btnInstallModpack��5C      #��� 
 6,   $��Install Modpack��6T   $
��Left=�6n   $��	21,22,0,0q�6�   $	��Top=�6�   $��32��6�   $	��111��6�   ���	#FF1E2430���	#FFCDCFD2���	#FFCDCFD2 J� RenderTransformOrigin$	 1,1&�6  6j  �� 5D   
   -   5        $ btnInstallMods��5D      #��� 
 6)   $��Update Modpack��6Q   $
��Left=�6j   $��
151,22,0,0q�6�   $	��Top=�6�   $��32��6�   $	��111��6�   ���	#FF1E2430���	#FFCDCFD2���	#FFCDCFD2$	 1,1&�6  6g  �� 5E   
   -   5        $ btnDeleteModpack��5E      #��� 
 6+   $��Delete Modpack��6S   $
��Left=�6l   $��
280,22,0,0q�6�   $	��Top=�6�   $��32��6�   $	��111��6�   ���	#FF1E2430���	#FFCDCFD2���	#FFCDCFD2$	 1,1&�6  6i  �� 5F   
   -   5         ��Name$ 	lblMadeBy��5F      $��Made by: Jaoryx��6#   $��309,267,0,0q�6=   ���	#FFCDCFD2$
��Left=�6i   $	��100��6�   $��26��6�   $	��Top=�6�   �� 5G   
   -   5         ��Name$ txtFeedback��5G      ${�False��6'    �� TextWrapping$
 Wrap=�69   $�� ��6M   $��22,73,17,49q�6U   ���	#FFCDCFD2���	#FFCDCFD2��6j   Z� 6�   5H      5I      