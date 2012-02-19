import android.media.MediaRecorder;
import android.media.MediaPlayer;
import android.os.Environment;
import android.content.Context;

class SoundManager {
  
  private MediaRecorder src; 

  private void recInit()throws IOException {
    src = new MediaRecorder();
    src.setAudioSource(MediaRecorder.AudioSource.VOICE_RECOGNITION);
    src.setOutputFormat(MediaRecorder.OutputFormat.DEFAULT);
    src.setAudioEncoder(MediaRecorder.AudioEncoder.DEFAULT); 
    src.setOutputFile(Environment.getExternalStorageDirectory().getPath()+"/flier_aux.3gp");
    src.prepare();
    isInitialized = true;
  }
  
  private boolean isWorking = false;
  
  private boolean isInitialized = false;
  
  public boolean isWorking(){
    return isWorking;
  }
  
  public void start()throws IOException{
    if(!isInitialized) recInit();
    src.start();
    isWorking = true;
  }
  
  public int getSoundValue(){
    int result = src.getMaxAmplitude();
    println("Sound is " + result);
    return result;
  }
  
  public void stop(){
    src.stop();
  }
  
  public SoundManager() throws IOException{
    recInit();
  }
};

