//
//  ViewController.m
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/25.
//

#import "SeachViewController.h"

@interface SeachViewController () <UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching, UISearchControllerDelegate, UISearchBarDelegate>

#pragma mark - UI
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UISearchController *searchBarController;
@property (nonatomic, retain) NSMutableArray<SearchBook *> *searchResult;
@property (nonatomic, strong) DetailViewController *detailViewController;

@property (nonatomic, strong) NSString *searchKeyword;
@end

@implementation SeachViewController

- (void)loadView{
  [super loadView];
  
  JHLog();
  
  [self.view setBackgroundColor:[UIColor whiteColor]];
  [self setTitle:@"Search"];
  
  [self setNavgationBar];
  [self setSearchBar];
  [self setTableView];
}

-(void)setNavgationBar{
  
  JHLog();
  
  [[self.navigationController navigationBar] setBackgroundColor:[UIColor colorWithWhite:1.0f alpha:0.7f]];
  [[self.navigationController navigationBar] setShadowImage:[[UIImage alloc] init]];
  [[self.navigationController navigationBar] setTranslucent:YES];
  [[self.navigationController navigationBar] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
  [[self.navigationController navigationBar] setPrefersLargeTitles:YES];
}

-(void)setSearchBar{
  
  JHLog();
  
  self.searchBarController = [[UISearchController alloc] initWithSearchResultsController:nil];
  [self.searchBarController setDelegate:self];
  [self.searchBarController setObscuresBackgroundDuringPresentation:NO];
  [self.searchBarController setShowsSearchResultsController:YES];
  [self.searchBarController.searchBar setDelegate:self];
  [self.navigationController setDefinesPresentationContext:YES];
  [self.searchBarController.searchBar setPlaceholder:@"Book Name"];
  [self.navigationItem setSearchController:self.searchBarController];
  [[self.navigationItem searchController] setActive:YES];
  [self.navigationItem setHidesSearchBarWhenScrolling:NO];
  [self.navigationItem setLargeTitleDisplayMode:UINavigationItemLargeTitleDisplayModeAutomatic];
}

-(void)setTableView{
  
  JHLog();
  
  self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
  [self.tableView setBackgroundColor:[UIColor clearColor]];
  [self.tableView setEstimatedRowHeight:UITableViewAutomaticDimension];
  [self.tableView setEstimatedRowHeight:100.0f];
  [self.tableView setPrefetchDataSource:self];
  [self.tableView registerClass:SearchTableViewCell.class forCellReuseIdentifier:@"TEST"];
  
  [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [self.view addSubview:self.tableView];
  [[[self.tableView topAnchor] constraintEqualToAnchor:[self.view topAnchor]] setActive:YES];
  [[[self.tableView leadingAnchor] constraintEqualToAnchor:[self.view leadingAnchor]] setActive:YES];
  [[[self.tableView trailingAnchor] constraintEqualToAnchor:[self.view trailingAnchor]] setActive:YES];
  [[[self.tableView bottomAnchor] constraintEqualToAnchor:[self.view bottomAnchor]] setActive:YES];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  JHLog();
  
  [self setDefinesPresentationContext:YES];
  
  _service = [[SearchServiceImpl alloc] init];
  _presenter = [[SearchPresenter alloc] init];
  [_presenter attchwithView:self service:_service];
  
  _cacheManger = [JHCacheManager shared];
  _searchResult = [[NSMutableArray alloc] init];
  
  [self.tableView setDelegate:self];
  [self.tableView setDataSource:self];
  
  [_presenter reqestDataWithKeyword:@"new"];
}


#pragma mark - SerachView Protocol

- (void)failToReqeustSearchData:(NSError *)error {
  
  JHLog();
  
}

-(void)successToReqeustSearchKeyword:(NSString *)keyword
                                data:(NSArray<SearchBook *> *)data{
  
  JHLog(@"keyword: %@, count: %lu", keyword, [data count]);
  
  for(SearchBook *book in data){
    __block NSData *imageData;
    if([self->_cacheManger isExistKeyword:book.isbn13]){
      imageData = [self->_cacheManger objectForKey:book.isbn13];
    } else {
      dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:book.image]];
        [self->_cacheManger setData:imageData forKey:book.isbn13];
      });
    }
  }
  
  if([self->_searchKeyword isEqual:keyword]){
    [self.searchResult addObjectsFromArray:data];
  } else {
    self->_searchKeyword = keyword;
    self.searchResult = [data mutableCopy];
  }
  
  dispatch_async(dispatch_get_main_queue(), ^{
    [self.tableView reloadData];
    [self.tableView setNeedsLayout];
  });
}


#pragma mark - TableView Delegate, DataSource

-(nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
  
  SearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TEST"];
  [cell.searchTitleLabel setText:[self.searchResult[indexPath.row] title]];
  [cell.searchSubtitleLabel setText:[self.searchResult[indexPath.row] subtitle]];
  [cell.searchIsbn13Label setText:[self.searchResult[indexPath.row] isbn13]];
  [cell.searchPriceLabel setText:[self.searchResult[indexPath.row] price]];
  [cell.searchUrlLabel setText:[self.searchResult[indexPath.row] url]];
  
  if([self->_cacheManger isExistKeyword:[self.searchResult[indexPath.row] isbn13]]){
    [cell setSearchImageInCell:[self->_cacheManger objectForKey:[self.searchResult[indexPath.row] isbn13]]];
  }
  
  return cell;
}

-(NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return [self.searchResult count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
  JHLog();
  
  [[[tableView cellForRowAtIndexPath:indexPath] contentView] setBackgroundColor:[UIColor whiteColor]];
  
  self->_detailViewController = [[DetailViewController alloc] initWtihISBN13:[self.searchResult[indexPath.row] isbn13]];
  [self.navigationController pushViewController:self->_detailViewController animated:YES];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
  if([self->_searchKeyword isEqual:@"new"]){
    return @"A new book has arrived!";
  }
  else if(self->_searchKeyword){
    NSString *sectionTitle = [NSString stringWithFormat:@"'%@' search results!",self->_searchKeyword];
    return sectionTitle;
  }
  else{
    return @"Search Result";
  }
}

- (void)tableView:(nonnull UITableView *)tableView prefetchRowsAtIndexPaths:(nonnull NSArray<NSIndexPath *> *)indexPaths {
  for(NSIndexPath *indexPath in indexPaths){
    if(indexPath.row + 3 == self.searchResult.count){
      [_presenter reqeustNextData];
    }
  }
}

#pragma mark - SearchController Delegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
  JHLog("%@",searchText);
  
  if(searchText.length == 0){
    [_presenter reqestDataWithKeyword:@"new"];
    return;
  }
  
  [_presenter reqestDataWithKeyword:searchText];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar API_UNAVAILABLE(tvos){
  [_presenter reqestDataWithKeyword:@"new"];
}

@end
