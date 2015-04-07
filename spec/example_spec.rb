describe "Viaduct" do
  it "should be cool" do
    expect(true).to be true
  end

  it "should be awesome" do
    expect(true).to be true
  end

  it "should be fast" do
    if ENV['MODE'] == 'fail-on-test'
      expect(true).to be false
    else
      expect(true).to be true
    end
  end

  200.times do |i|
    it "should be blue #{i}" do
      expect('blue').to eq('blue')
    end
  end
end
