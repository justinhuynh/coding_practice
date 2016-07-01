class CodeFile
  FILE_SUFFIX = ".rb"

  attr_reader :full_path

  def initialize(full_path)
    @full_path = full_path
  end

  def file_stem
    File.basename(full_path, FILE_SUFFIX)
  end



  def file_name
    File.basename(full_path)
  end

  def class_name
    camelcase(file_stem)
  end

  private

  def camelcase(string)
    string.split('_').collect(&:capitalize).join
  end
end
