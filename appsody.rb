class Appsody < Formula
    desc "Appsody command-line interface"
    homepage "https://github.com/appsody/appsody#readme"
    version "0.0.7"
    url "https://github.com/chilanti/appsody/releases/download/0.0.7/appsody-homebrew-0.0.7.tar.gz" 
    sha256 "f9096ce226cf99613564712107303c7568bdf69662148b99e34df4154628688d"
  #  url "https://github.com/appsody/appsody/archive/master.zip",
  #      :tag      => "master"
  #      :revision => "b5d4f876f4bfe294b70c092210613e30eceb0dc4"
  #  head "git@github.com:appsody/appsody.git"
  
  #  bottle do
  def install
    bin.install "appsody"
    bin.install "appsody-controller" 
    ohai "Checking prerequisites..."
    #system "docker"
    retval=check_prereqs

      if retval
        ohai "Done."
     else
        opoo "Docker not detected. Please ensure docker is installed and running before using appsody."
      end
  end
  def check_prereqs
    begin
      original_stderr = $stderr.clone
      original_stdout = $stdout.clone
      $stderr.reopen(File.new('/dev/null', 'w'))
      $stdout.reopen(File.new('/dev/null', 'w'))
      begin
        system('/usr/local/bin/docker', 'ps')
        retval=true
      rescue
        retval=false
      end
    rescue Exception => e
      $stdout.reopen(original_stdout)
      $stderr.reopen(original_stderr)
      raise e
    ensure
      $stdout.reopen(original_stdout)
      $stderr.reopen(original_stderr)
    end
    return retval
  end  

  
    test do
      raise "Test not implemented."
    end
  end
  
