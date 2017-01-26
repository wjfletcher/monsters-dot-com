import Monster from 'components/Monster';
import { shallow } from 'enzyme';
import React from 'react';

describe('Monster', function() {
  let image,
      text,
      className,
      wrapper;

  beforeEach(() => {
    wrapper = shallow(
      <Monster
        name="Freddy Kruger"
        img="http://az795576.vo.msecnd.net/bh-uploads/2016/06/freddy-krueger1-1.jpg"
        text="Description: He sees you when you're sleeping"
      />
    );
  });
  it('should render an h4 tag', () => {
    expect(wrapper.find('h4').length).toEqual(1);
  });

  it('should render an h4 tag with the text "Freddy Kruger"', () => {
    expect(wrapper.find('h4').text()).toBe("Freddy Kruger");
  });

  it('should render an img tag with the specific props', () => {
    expect(wrapper.find('img').props()).toEqual({
      className: "recent-monster",
      src: 'http://az795576.vo.msecnd.net/bh-uploads/2016/06/freddy-krueger1-1.jpg'
    });
  });

});
