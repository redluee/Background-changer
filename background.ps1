$setwallpapersrc = @"
using System.Runtime.InteropServices;

public class Wallpaper
{
  public const int SetDesktopWallpaper = 20;
  public const int UpdateIniFile = 0x01;
  public const int SendWinIniChange = 0x
  [DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
  private static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
  public static void SetWallpaper(string path)
  {
    SystemParametersInfo(SetDesktopWallpaper, 0, path, UpdateIniFile | SendWinIniChange);
  }
}
"@
Add-Type -TypeDefinition $setwallpapersrc

$link = "https://source.unsplash.com/random/1920x1080/?wallpaper,Mountain"
while (0 -eq 0){
  Invoke-WebRequest $link -outfile C:\temp\test.jpg
  $img = "C:\temp\test.jpg"
  [Wallpaper]::SetWallpaper($img)
  Start-Sleep -seconds 300
}