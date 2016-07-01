class TestFile
  TEST_FILE_SUFFIX = "_spec.rb"

  attr_reader :code_file, :test_code

  def initialize(code_file)
    @code_file = code_file
  end

  def file_name
    code_file.full_path.sub(/#{CodeFile::FILE_SUFFIX}$/, TEST_FILE_SUFFIX)
  end

  def create_file
    File.write(file_name, test_code)
  end


end
